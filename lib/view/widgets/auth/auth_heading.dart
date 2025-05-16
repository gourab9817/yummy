import 'package:flutter/material.dart';

class AuthHeading extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  const AuthHeading({
    Key? key,
    required this.text,
    this.fontSize = 28,
    this.color = Colors.black,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: 'Serif',
      ),
      textAlign: TextAlign.center,
    );
  }
} 