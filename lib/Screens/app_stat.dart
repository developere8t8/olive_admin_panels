import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olive_admin_panel/Widgets/container-thre.dart';
import 'package:olive_admin_panel/Widgets/container-two.dart';
import 'package:olive_admin_panel/Widgets/container.dart';
import 'package:olive_admin_panel/models/like.dart';
import 'package:olive_admin_panel/models/swip.dart';
import 'package:olive_admin_panel/models/users.dart';
import 'package:sizer/sizer.dart';

class AppStatis extends StatefulWidget {
  const AppStatis({Key? key}) : super(key: key);

  @override
  State<AppStatis> createState() => _AppStatisState();
}

class _AppStatisState extends State<AppStatis> {
  bool isLoading = false;
  List<UserData> users = [];
  List<UserData> active = [];
  List<UserData> male = [];
  List<UserData> female = [];
  List<Liked> matches = [];
  List<Waved> waves = [];
  List<SwipeData> swips = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'APP STATISTICS',
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
              padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
              child: Center(
                child: Wrap(
                  spacing: 40,
                  runSpacing: 40,
                  children: [
                    ContainTwo(
                      txt: 'Active\n Users',
                      fnc: () {},
                      iconData: (Icons.supervised_user_circle_rounded),
                      hight: 160,
                      width: 230,
                      string1: 'Active',
                      string2: 'Total',
                      num2: users.isEmpty ? 0 : users.length,
                      num1: active.isEmpty ? 0 : active.length,
                    ),
                    ContainTwo(
                      txt: 'Gender Ratio',
                      fnc: () {},
                      iconData: (Icons.groups),
                      hight: 160,
                      width: 230,
                      string1: 'Male',
                      string2: 'Female',
                      num2: female.isEmpty ? 0 : female.length,
                      num1: male.isEmpty ? 0 : male.length,
                    ),
                    ContainThre(
                      txt: 'Total Swipes',
                      fnc: () {},
                      iconData: (Icons.swipe),
                      hight: 160,
                      width: 230,
                      num1: swips.isEmpty ? 0 : swips.length,
                      string1: 'Swipes',
                    ),
                    ContainThre(
                      txt: 'Total Matches',
                      fnc: () {},
                      iconData: (Icons.animation),
                      hight: 160,
                      width: 230,
                      num1: matches.isEmpty ? 0 : matches.length,
                      string1: 'Matches',
                    ),
                    ContainThre(
                      txt: 'Total Waves',
                      fnc: () {},
                      iconData: (Icons.waves_outlined),
                      hight: 160,
                      width: 230,
                      num1: waves.isEmpty ? 0 : waves.length,
                      string1: 'Waves',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

//getting app data

  Future getData() async {
    setState(() {
      isLoading = true;
    });
    //getting total number of users
    QuerySnapshot usersnap = await FirebaseFirestore.instance.collection('app-users').get();
    if (usersnap.docs.isNotEmpty) {
      users = usersnap.docs.map((e) => UserData.fromMap(e.data() as Map<String, dynamic>)).toList();
      active = users.where((element) => element.type == 'active').toList();
      male = users.where((element) => element.gender!.toLowerCase() == 'male').toList();
      female = users.where((element) => element.gender!.toLowerCase() == 'female').toList();
    }
    QuerySnapshot likedsnap = await FirebaseFirestore.instance
        .collection('like-requests')
        .where('liked-back', isEqualTo: true)
        .get();
    if (likedsnap.docs.isNotEmpty) {
      matches = likedsnap.docs.map((e) => Liked.fromMap(e.data() as Map<String, dynamic>)).toList();
    }
    QuerySnapshot wavesnap = await FirebaseFirestore.instance
        .collection('wave-requests')
        .where('waved-back', isEqualTo: true)
        .get();
    if (wavesnap.docs.isNotEmpty) {
      waves = wavesnap.docs.map((e) => Waved.fromMap(e.data() as Map<String, dynamic>)).toList();
    }

    QuerySnapshot swipSnap = await FirebaseFirestore.instance.collection('swips').get();
    if (swipSnap.docs.isNotEmpty) {
      swips = swipSnap.docs.map((e) => SwipeData.fromMap(e.data() as Map<String, dynamic>)).toList();
    }

    setState(() {});
  }
}
