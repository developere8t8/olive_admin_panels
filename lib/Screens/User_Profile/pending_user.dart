import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:olive_admin_panel/Widgets/btn-two.dart';
import 'package:olive_admin_panel/Widgets/btn.dart';
import 'package:olive_admin_panel/models/users.dart';

import '../../Widgets/constant.dart';

class PendingUUser extends StatefulWidget {
  const PendingUUser({Key? key}) : super(key: key);

  @override
  State<PendingUUser> createState() => _PendingUUserState();
}

class _PendingUUserState extends State<PendingUUser> {
  List<UserData> pending = [];
  String idFront = '';
  String idBack = '';
  String idMan = '';
  String userID = '';
  int currentIndex = 0;
  bool isLoadingupdate = false;
  bool isLoading = false;

  @override
  void initState() {
    getPending();
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
          'PENDING USERS',
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
                          itemCount: pending.isEmpty ? 0 : pending.length,
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
                                leading: pending[index].profileImgs!.isNotEmpty
                                    ? CircleAvatar(
                                        radius: 50,
                                        backgroundImage: NetworkImage(pending[index].profileImgs![0]),
                                      )
                                    : const CircleAvatar(
                                        radius: 50,
                                        backgroundImage: AssetImage('images/bb.jpg'),
                                      ),
                                title: Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Text(
                                    pending[index].userName.toString(),
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
                                      idBack = pending[index].idCardBack!;
                                      idFront = pending[index].idCardFront!;
                                      idMan = pending[index].idCardWithPerson!;
                                      userID = pending[index].id!;
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
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            'ID Card Front',
                            style: TextStyle(
                                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 160,
                            width: 300,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                            child: idBack.isEmpty
                                ? Container()
                                : Image.network(
                                    idFront,
                                    fit: BoxFit.fill,
                                  ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'ID Card Back',
                            style: TextStyle(
                                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 160,
                            width: 300,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                            child: idBack.isEmpty
                                ? Container()
                                : Image.network(
                                    idBack,
                                    fit: BoxFit.fill,
                                  ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Holding ID Card',
                            style: TextStyle(
                                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 160,
                            width: 300,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                            child: idBack.isEmpty
                                ? Container()
                                : Image.network(
                                    idMan,
                                    fit: BoxFit.fill,
                                  ),
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
                                    txt: 'Approve',
                                    fnc: () async {
                                      setState(() {
                                        isLoadingupdate = true;
                                      });
                                      final user =
                                          FirebaseFirestore.instance.collection('app-users').doc(userID);
                                      await user.update({'type': 'active'});
                                      setState(() {
                                        pending.removeAt(currentIndex);
                                        idBack = '';
                                        idFront = '';
                                        idMan = '';
                                        isLoadingupdate = false;
                                      });

                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return const AlertDialog(
                                              title: Text('Message'),
                                              content: Text('User Approved'),
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
                                    txt: 'Decline',
                                    fnc: () async {
                                      setState(() {
                                        isLoadingupdate = true;
                                      });
                                      final user =
                                          FirebaseFirestore.instance.collection('app-users').doc(userID);
                                      await user.update({'type': 'rejected'});
                                      setState(() {
                                        pending.removeAt(currentIndex);
                                        idBack = '';
                                        idFront = '';
                                        idMan = '';
                                        isLoadingupdate = false;
                                      });

                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return const AlertDialog(
                                              title: Text('Message'),
                                              content: Text('User Banned'),
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  //getting accepted Users
  Future getPending() async {
    setState(() {
      isLoading = true;
    });
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('app-users')
        .where('type', isEqualTo: 'pending')
        .get();
    if (snapshot.docs.isNotEmpty) {
      pending = snapshot.docs.map((e) => UserData.fromMap(e.data() as Map<String, dynamic>)).toList();
    }
    isLoading = false;
    setState(() {});
  }
}
