import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:olive_admin_panel/Widgets/btn-two.dart';
import 'package:olive_admin_panel/models/admin.dart';

import '../../Widgets/constant.dart';

class PendingAdmin extends StatefulWidget {
  const PendingAdmin({Key? key}) : super(key: key);

  @override
  State<PendingAdmin> createState() => _PendingAdminState();
}

class _PendingAdminState extends State<PendingAdmin> {
  List<AdminData> admins = [];
  String name = '';
  String email = '';
  String phone = '';
  String adminID = '';
  int currentIndex = 0;
  bool isLoadingupdate = false;
  bool isLoading = false;

  @override
  void initState() {
    getAdmins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFD5F76),
        centerTitle: true,
        title: const Text(
          'ADMINS',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: isLoading
            ? const Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: LoadingIndicator(
                      indicatorType: Indicator.ballPulse,
                      colors: [Colors.white],
                    ),
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 5,
                      child: ListView.builder(
                          itemCount: admins.isEmpty ? 0 : admins.length,
                          shrinkWrap: true,
                          primary: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                horizontalTitleGap: 10,
                                minLeadingWidth: 20,
                                tileColor: secondaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Text(
                                    admins[index].name.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                trailing: InkWell(
                                  onTap: () {
                                    setState(() {
                                      name = admins[index].name!;
                                      email = admins[index].email!;
                                      adminID = admins[index].id!;
                                      currentIndex = index;
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color(0xffFE805A),
                                        width: 2,
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'DETAIL',
                                        style: TextStyle(
                                          color: Color(0xffFE805A),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                  Expanded(
                      flex: 2,
                      child: Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 250,
                          child: Column(children: [
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 30,
                                ),
                                const Text(
                                  'NAME:',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                Expanded(
                                  child: Text(
                                    name.toString(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 30,
                                ),
                                const Text(
                                  'EMAIL:',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                Expanded(
                                  child: Text(
                                    email.toString(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              child: isLoadingupdate
                                  ? const SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Center(
                                        child: LoadingIndicator(
                                          indicatorType: Indicator.ballPulse,
                                          colors: [Colors.white],
                                        ),
                                      ),
                                    )
                                  : BtnTwo(
                                      txt: 'SEND PASSWORD RESET EMAIL',
                                      fnc: () async {
                                        setState(() {
                                          isLoadingupdate = true;
                                        });
                                        await FirebaseAuth.instance
                                            .sendPasswordResetEmail(email: email.trim());
                                        setState(() {
                                          isLoadingupdate = false;
                                        });

                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return const AlertDialog(
                                                title: Text('Message'),
                                                content: Text('Password reset email sent'),
                                                actions: [CloseButton()],
                                              );
                                            });
                                      },
                                      height: screensize.height / 10,
                                      widh: screensize.width / 4,
                                      clr: Colors.green,
                                    ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              child: isLoadingupdate
                                  ? const SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Center(
                                        child: LoadingIndicator(
                                          indicatorType: Indicator.ballPulse,
                                          colors: [Colors.white],
                                        ),
                                      ),
                                    )
                                  : BtnTwo(
                                      txt: 'Delete',
                                      fnc: () async {
                                        setState(() {
                                          isLoadingupdate = true;
                                        });
                                        final user =
                                            FirebaseFirestore.instance.collection('admins').doc(adminID);
                                        await user.delete();
                                        setState(() {
                                          admins.removeAt(currentIndex);
                                          name = '';
                                          email = '';
                                          isLoadingupdate = false;
                                        });

                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return const AlertDialog(
                                                title: Text('Message'),
                                                content: Text('Admin deleted'),
                                                actions: [CloseButton()],
                                              );
                                            });
                                      },
                                      height: screensize.height / 10,
                                      widh: screensize.width / 4,
                                      clr: Colors.red,
                                    ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ])))
                ],
              ),
      ),
    );
  }

  //getting accepted Users
  Future getAdmins() async {
    setState(() {
      isLoading = true;
    });
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('admins').get();
    if (snapshot.docs.isNotEmpty) {
      admins = snapshot.docs.map((e) => AdminData.fromMap(e.data() as Map<String, dynamic>)).toList();
    }
    isLoading = false;
    setState(() {});
  }
}
