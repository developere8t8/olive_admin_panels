import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ContainThre extends StatelessWidget {
  const ContainThre(
      {Key? key,
      required this.txt,
      required this.fnc,
      required this.iconData,
      required this.hight,
      required this.string1,
      required this.num1,
      required this.width})
      : super(key: key);

  final String txt;
  final Function fnc;
  final IconData iconData;
  final double hight;
  final double width;
  final String string1;
  final int num1;

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        fnc();
      },
      child: Container(
        height: hight,
        width: width,
        decoration: BoxDecoration(
          color: Color(0xffFD5F76),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(02, 2),
            )
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Text(
                    txt,
                    style: TextStyle(
                      color: Colors.black,
                      shadows: [
                        Shadow(
                          color: Color(0xffFD5F76).withOpacity(0.3),
                          offset: Offset(1, 3),
                        )
                      ],
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                    child: Icon(
                  iconData,
                  size: 38,
                ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  string1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  num1.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
