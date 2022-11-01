import 'package:flutter/material.dart';
import 'package:olive_admin_panel/Widgets/btn.dart';
import 'package:olive_admin_panel/Widgets/txt_filed.dart';

class ResetPasswors extends StatefulWidget {
  const ResetPasswors({Key? key}) : super(key: key);

  @override
  State<ResetPasswors> createState() => _ResetPassworsState();
}

class _ResetPassworsState extends State<ResetPasswors> {
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFD5F76),
        centerTitle: true,
        title: const Text(
          'RESET PASSWORD',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 12.0, bottom: 10),
                  child: Text(
                    'CURRENT PASSWORD',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            txtfield(
              text: 'Current Pasword',
              hight: screensize.height / 10,
              width: screensize.width / 1.9,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 12.0, bottom: 10),
                  child: Text(
                    'NEW PASSWORD',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            txtfield(
              text: 'New Pasword',
              hight: screensize.height / 10,
              width: screensize.width / 1.9,
            ),
            const SizedBox(
              height: 40,
            ),
            Btn(
              txt: 'RESET',
              fnc: () {
                print('pok');
              },
              height: screensize.height / 10,
              widh: screensize.width / 4,
            )
          ],
        ),
      ),
    );
  }
}
