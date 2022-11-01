import 'package:flutter/material.dart';

class txtfield extends StatelessWidget {
  txtfield({
    Key? key,
    required this.text,
    this.suffixIcon,
    this.controller,
    this.errorTxt,
    this.validate,
    this.onchange,
    this.keyboradType,
    this.obscure,
    this.maxlines,
    required this.hight,
    required this.width,
  }) : super(key: key);

  final maxlines;
  final String text;
  final double hight;
  final double width;
  final Icon? suffixIcon;
  TextEditingController? controller;
  String? errorTxt;
  bool? validate;
  final onchange;
  final keyboradType;
  final obscure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 8.0, right: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: hight,
              width: width,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10, top: 5),
                    hintText: text,
                    border: InputBorder.none),
                controller: controller,
                // ignore: body_might_complete_normally_nullable
                validator: (value) {
                  if (validate != null) {
                    if (value == null || value.isEmpty) {
                      return errorTxt;
                    }
                    return null;
                  }
                },
                onChanged: onchange,
                keyboardType: keyboradType,
                obscureText: obscure ?? false,
                maxLines: maxlines,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
