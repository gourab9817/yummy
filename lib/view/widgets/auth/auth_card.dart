import 'package:flutter/material.dart';

class AuthCard extends StatelessWidget {
  final Widget child;
  final double imageRadius;
  final EdgeInsetsGeometry? padding;

  const AuthCard({
    Key? key,
    required this.child,
    required this.imageRadius,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.only(
        top: imageRadius / 2 + 24,
        left: 24,
        right: 24,
        bottom: 32,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: child,
          ),
        ),
      ),
    );
  }
} 