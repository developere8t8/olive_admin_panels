import 'package:flutter/material.dart';

class Btn extends StatefulWidget {
  const Btn({Key? key, required this.txt, required this.fnc, required this.height, required this.widh}) : super(key: key);
  final String txt;
  final Function fnc;
  final double height;
  final double widh;

  @override
  State<Btn> createState() => _BtnState();
}

class _BtnState extends State<Btn> {
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;

    return MaterialButton(
      onPressed: () {
        widget.fnc();
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      color: Color(0xffFD5F76),
      child: Text(
        widget.txt,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
      height: widget.height,
      minWidth: widget.widh
    );
  }
}
