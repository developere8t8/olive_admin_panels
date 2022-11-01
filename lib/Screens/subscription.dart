import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:olive_admin_panel/models/subscribe.dart';

class SubscriptionsSetting extends StatefulWidget {
  const SubscriptionsSetting({super.key});

  @override
  State<SubscriptionsSetting> createState() => _SubscriptionsSettingState();
}

class _SubscriptionsSettingState extends State<SubscriptionsSetting> {
  bool? subscribe = false;
  SubscriptionData? data;
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SUBSCRIPTION SETTING',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Center(
                child: SizedBox(
                  width: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Sucriptions'),
                      Switch(
                          value: subscribe!,
                          onChanged: (value) async {
                            await FirebaseFirestore.instance
                                .collection('subscription')
                                .doc(data!.id!)
                                .update({'enabled': value});
                            setState(() {
                              subscribe = value;
                              data!.enable = value;
                            });
                          })
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future getData() async {
    QuerySnapshot snap = await FirebaseFirestore.instance.collection('subscription').get();

    if (snap.docs.isNotEmpty) {
      data = SubscriptionData.fromMap(snap.docs.first.data() as Map<String, dynamic>);
      subscribe = data!.enable!;
    }
    setState(() {});
  }
}
