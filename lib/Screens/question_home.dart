import 'package:flutter/material.dart';
import 'package:olive_admin_panel/Screens/Dishes/dishes.dart';
import 'package:olive_admin_panel/Screens/Dishes/edit_dish.dart';
import 'package:olive_admin_panel/Screens/User_Profile/accepted_user.dart';
import 'package:olive_admin_panel/Screens/User_Profile/baned_users.dart';
import 'package:olive_admin_panel/Screens/User_Profile/change_detail.dart';
import 'package:olive_admin_panel/Screens/User_Profile/pending_admin.dart';
import 'package:olive_admin_panel/Screens/User_Profile/pending_user.dart';
import 'package:olive_admin_panel/Screens/User_Profile/reset_password.dart';
import 'package:olive_admin_panel/Screens/edit_question.dart';
import 'package:olive_admin_panel/Screens/prefrences_question.dart';
import 'package:olive_admin_panel/Widgets/container.dart';

class QuesHomePage extends StatefulWidget {
  const QuesHomePage({Key? key}) : super(key: key);

  @override
  State<QuesHomePage> createState() => _QuesHomePageState();
}

class _QuesHomePageState extends State<QuesHomePage> {
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 15),
            child: Row(
              children: const [
                Text(
                  'QUESTIONS',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 22),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 130,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 70,
                ),
                Contain(
                    txt: 'Edit Question',
                    fnc: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditQuestion(),
                        ),
                      );
                    },
                    iconData: (Icons.edit_note),
                    hight: screensize.height / 4.8,
                    width: screensize.width / 5),
                const SizedBox(
                  width: 35,
                ),
                const SizedBox(
                  width: 35,
                ),
                Contain(
                    txt: 'Add Question',
                    fnc: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrefrencesQuestion(),
                        ),
                      );
                    },
                    iconData: (Icons.add_circle),
                    hight: screensize.height / 4.8,
                    width: screensize.width / 5),
              ],
            ),
          ),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
