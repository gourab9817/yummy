import 'package:flutter/material.dart';

class AuthDivider extends StatelessWidget {
  final String text;
  const AuthDivider({Key? key, this.text = 'or'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(text),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
} 