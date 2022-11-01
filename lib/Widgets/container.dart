import 'package:flutter/material.dart';

class Contain extends StatelessWidget {
  const Contain({Key? key, required this.txt, required this.fnc, required this.iconData, required this.hight, required this.width}) : super(key: key);

  final String txt;
  final Function fnc;
  final IconData iconData;
  final double hight;
  final double width;


  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;

    return  InkWell(
      onTap: (){
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
        child: Row(
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
                  fontSize: 22 ,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(child: Icon(iconData,size: 38,))
          ],
        ),
      ),
    );
  }
}
