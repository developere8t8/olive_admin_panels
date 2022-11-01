import 'package:flutter/material.dart';
import 'package:olive_admin_panel/Screens/User_Profile/accepted_user.dart';
import 'package:olive_admin_panel/Screens/User_Profile/baned_users.dart';
import 'package:olive_admin_panel/Screens/User_Profile/change_detail.dart';
import 'package:olive_admin_panel/Screens/User_Profile/pending_admin.dart';
import 'package:olive_admin_panel/Screens/User_Profile/pending_user.dart';
import 'package:olive_admin_panel/Screens/User_Profile/reset_password.dart';
import 'package:olive_admin_panel/Widgets/container.dart';
import 'package:olive_admin_panel/models/admin.dart';
import 'package:olive_admin_panel/models/users.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
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
                  'USER PROFILE',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 22),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 80,
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
                    txt: 'Baned Users',
                    fnc: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BanedUser(),
                        ),
                      );
                    },
                    iconData: (Icons.cancel_presentation),
                    hight: screensize.height / 4.8,
                    width: screensize.width / 5),
                const SizedBox(
                  width: 35,
                ),
                Contain(
                    txt: 'Accepted Users',
                    fnc: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AcceptedUser(),
                        ),
                      );
                    },
                    iconData: (Icons.verified),
                    hight: screensize.height / 4.8,
                    width: screensize.width / 5),
                const SizedBox(
                  width: 35,
                ),
                Contain(
                    txt: 'Pending Users',
                    fnc: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PendingUUser(),
                        ),
                      );
                    },
                    iconData: (Icons.pending),
                    hight: screensize.height / 4.8,
                    width: screensize.width / 5),
              ],
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 70,
                ),
                // Contain(
                //     txt: 'Notification',
                //     fnc: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => const ChangeDetail(),
                //         ),
                //       );
                //     },
                //     iconData: (Icons.notifications),
                //     hight: screensize.height / 4.8,
                //     width: screensize.width / 5),
                // const SizedBox(width: 35),
                // Contain(
                //     txt: 'Reset Password',
                //     fnc: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => const ResetPasswors(),
                //         ),
                //       );
                //     },
                //     iconData: (Icons.reset_tv),
                //     hight: screensize.height / 4.8,
                //     width: screensize.width / 5),
                const SizedBox(
                  width: 35,
                ),
                Contain(
                    txt: 'Admins',
                    fnc: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PendingAdmin(),
                        ),
                      );
                    },
                    iconData: (Icons.pending_actions),
                    hight: screensize.height / 4.8,
                    width: screensize.width / 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
