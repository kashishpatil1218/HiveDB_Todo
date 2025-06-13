import 'package:flutter/material.dart';

class Buttonspage extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  Buttonspage({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Color(0xff2F0123),
      child: Text(text, style: TextStyle(color: Colors.grey.shade100)),
    );
  }
}
