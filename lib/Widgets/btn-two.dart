import 'package:flutter/material.dart';

class BtnTwo extends StatefulWidget {
  const BtnTwo({Key? key, required this.txt, required this.fnc, required this.height, required this.widh, required this.clr}) : super(key: key);
  final String txt;
  final Function fnc;
  final double height;
  final double widh;
  final Color clr;

  @override
  State<BtnTwo> createState() => _BtnTwoState();
}

class _BtnTwoState extends State<BtnTwo> {
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;

    return MaterialButton(
        onPressed: () {
          widget.fnc();
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        color: widget.clr,
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
