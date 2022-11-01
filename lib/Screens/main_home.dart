import 'package:flutter/material.dart';
import 'package:olive_admin_panel/Login/create_admin.dart';
import 'package:olive_admin_panel/Screens/Dishes/dish_home.dart';
import 'package:olive_admin_panel/Screens/User_Profile/user_profile.dart';
import 'package:olive_admin_panel/Screens/app_stat.dart';
import 'package:olive_admin_panel/Screens/question_home.dart';
import 'package:olive_admin_panel/Screens/subscription.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _selectedDestination = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const AppStatis(),
    const DishHomePage(),
    const UserProfile(),
    const QuesHomePage(),
    const LoginDetail(),
    const SubscriptionsSetting()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFD5F76),
        title: const Text(
          'OLIVE ADMIN PANEL',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 22),
        ),
        centerTitle: true,
        // leading: IconButton(
        //     onPressed: () {

        //     },
        //     icon: const Icon(
        //       Icons.menu,
        //       color: Colors.white,
        //     )),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          children: [
            Container(
              color: const Color(0xffFD5F76),
              height: 56,
            ),
            const SizedBox(
              height: 25,
            ),
            ListTile(
              iconColor: Colors.white38,
              textColor: Colors.white38,
              leading: const Icon(Icons.auto_graph),
              title: const Text('APP STATISICS'),
              selectedTileColor: const Color(0xffFD5F76),
              selectedColor: Colors.white,
              onTap: () => selectDestination(0),
              selected: _selectedDestination == 0,
            ),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              iconColor: Colors.white38,
              textColor: Colors.white38,
              leading: const Icon(Icons.fastfood),
              selectedTileColor: const Color(0xffFD5F76),
              selectedColor: Colors.white,
              title: const Text('DISHES'),
              onTap: () => selectDestination(1),
              selected: _selectedDestination == 1,
            ),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              iconColor: Colors.white38,
              textColor: Colors.white38,
              leading: const Icon(Icons.group),
              title: const Text('USER PROFILE'),
              selectedTileColor: const Color(0xffFD5F76),
              selectedColor: Colors.white,
              onTap: () => selectDestination(2),
              selected: _selectedDestination == 2,
            ),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              iconColor: Colors.white38,
              textColor: Colors.white38,
              selectedTileColor: const Color(0xffFD5F76),
              selectedColor: Colors.white,
              leading: const Icon(Icons.question_answer_outlined),
              title: const Text('PREFRENCES QUESTIONS'),
              onTap: () => selectDestination(3),
              selected: _selectedDestination == 3,
            ),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              iconColor: Colors.white38,
              textColor: Colors.white38,
              selectedTileColor: const Color(0xffFD5F76),
              selectedColor: Colors.white,
              leading: const Icon(Icons.person),
              title: const Text('CREATE ADMIN'),
              onTap: () => selectDestination(4),
              selected: _selectedDestination == 4,
            ),
            ListTile(
              iconColor: Colors.white38,
              textColor: Colors.white38,
              selectedTileColor: const Color(0xffFD5F76),
              selectedColor: Colors.white,
              leading: const Icon(Icons.person),
              title: const Text('SETTING'),
              onTap: () => selectDestination(5),
              selected: _selectedDestination == 5,
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedDestination),
    ));
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
    Navigator.pop(context);
  }
}
