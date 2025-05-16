import 'package:flutter/material.dart';
import 'package:yummy/core/theme/app_colors.dart';

class AuthCodeInput extends StatelessWidget {
  final int length;
  const AuthCodeInput({Key? key, this.length = 4}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) => _buildCodeBox()),
    );
  }

  Widget _buildCodeBox() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 48,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.primary, width: 2),
      ),
      alignment: Alignment.center,
      child: const Text(
        '-',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
} 