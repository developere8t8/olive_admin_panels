import 'package:flutter/material.dart';

class text extends StatelessWidget {
  const text({
    Key? key,
    required this.txt,
    required this.size,
  }) : super(key: key);
  final String txt;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    );
  }
}
