import 'package:flutter/material.dart';
import 'package:yummy/core/constants/app_assets.dart';

class AuthLogo extends StatelessWidget {
  final double height;
  const AuthLogo({Key? key, this.height = 60}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.yummy_logo,
      height: height,
    );
  }
} 