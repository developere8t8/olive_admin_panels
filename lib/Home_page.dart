import 'package:flutter/material.dart';
import 'package:olive_admin_panel/Widgets/container.dart';
import 'package:olive_admin_panel/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xffFD5F76),
        title: Text('OLIVE ADMIN PANEL'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 110,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Contain(
                  txt: 'APP STATISICS',
                  fnc: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => draw()));
                  },
                  iconData: (Icons.auto_graph),
                  hight: screensize.height / 4.8,
                  width: screensize.width / 4,
                ),
                Contain(
                  txt: 'DISHES',
                  fnc: () {
                    print('ok');
                  },
                  iconData: (Icons.fastfood),
                  hight: screensize.height / 4.8,
                  width: screensize.width / 4,
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Contain(
                  txt: 'USER PROFILE',
                  fnc: () {},
                  iconData: (Icons.group),
                  hight: screensize.height / 4.8,
                  width: screensize.width / 4,
                ),
                Contain(
                  txt: 'PREFRENCES\n QUESTIONS',
                  fnc: () {
                    print('ok');
                  },
                  iconData: (Icons.question_answer_outlined),
                  hight: screensize.height / 4.8,
                  width: screensize.width / 4,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
