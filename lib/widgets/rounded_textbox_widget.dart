import '../style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundedTextboxWidget extends StatelessWidget {
  TextEditingController controller;
  TextInputType keyboardType;
  bool enabled;
  int minLine;
  int maxLine;
  String labelText;
  bool obscureText;
  TextAlign textAlign;
  double verticalMargin;
  String? Function(dynamic)? validator;

  RoundedTextboxWidget({
    Key? key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
    this.minLine = 1,
    this.maxLine = 1,
    this.verticalMargin = 20,
    this.textAlign = TextAlign.left,
    required this.labelText,
    this.obscureText = false,
    this.validator,
  }) : super(key: key);

  static InputBorder enabledBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xffDFDFDF),
    ),
  );

  static InputBorder errorBorder = const OutlineInputBorder(borderSide: BorderSide(color: Colors.red));
  static InputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
      width: 0,
      style: BorderStyle.none,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0.0),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(60),
      ),
      child: TextFormField(
        style: const TextStyle(fontSize: 14.0),
        maxLines: maxLine,
        minLines: minLine,
        keyboardType: keyboardType,
        autofocus: false,
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        cursorColor: greenLvl1,
        cursorHeight: 15,
        textAlign: textAlign,
        decoration: InputDecoration(
          border: border,
          labelText: labelText,
          enabled: enabled,
          labelStyle: hintStyle,
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        ),
      ),
    );
  }
}
