import 'package:flutter/material.dart';
import 'package:yummy/core/theme/app_colors.dart';
import 'package:yummy/core/theme/app_theme.dart';
import 'package:yummy/core/constants/app_assets.dart';
import 'package:yummy/view/widgets/auth/auth_card.dart';
import 'package:yummy/view/widgets/auth/auth_logo.dart';
import 'package:yummy/view/widgets/auth/auth_heading.dart';
import 'package:yummy/view/widgets/auth/auth_input_field.dart';
import 'package:yummy/view/widgets/auth/auth_button.dart';

class VerifyKeyboardScreen extends StatelessWidget {
  const VerifyKeyboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double imageRadius = 90;
    return Scaffold(
      backgroundColor: const Color(0xFFF6FBF4),
      body: Stack(
        children: [
          // Card with form
          Positioned(
            top: imageRadius,
            left: 0,
            right: 0,
            bottom: 0,
            child: AuthCard(
              imageRadius: imageRadius,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const AuthLogo(height: 60),
                  const SizedBox(height: 16),
                  const AuthHeading(text: 'Verify Your Phone Number'),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      SizedBox(
                        width: 80,
                        child: AuthInputField(labelText: '+91'),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: AuthInputField(
                          labelText: 'Phone Number',
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  AuthButton(
                    text: 'Sign Up',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          // Food image (overlapping card)
          Positioned(
            top: imageRadius / 2,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: imageRadius * 2,
                height: imageRadius * 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    AppAssets.verify,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 