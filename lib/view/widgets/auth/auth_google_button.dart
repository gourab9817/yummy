import 'package:flutter/material.dart';
import 'package:yummy/core/constants/app_assets.dart';

class AuthGoogleButton extends StatelessWidget {
  final VoidCallback? onTap;
  const AuthGoogleButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(32),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(AppAssets.google_logo),
        ),
      ),
    );
  }
} 