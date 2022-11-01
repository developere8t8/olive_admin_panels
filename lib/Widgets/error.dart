//for shwing Error messages
import 'package:flutter/material.dart';

showMsg(String msg, Icon icon, BuildContext context) {
  final snackBar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            msg,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        icon
      ],
    ),
    duration: const Duration(seconds: 2),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
