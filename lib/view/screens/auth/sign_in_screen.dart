import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yummy/core/theme/app_colors.dart';
import 'package:yummy/core/theme/app_theme.dart';
import 'package:yummy/core/constants/app_assets.dart';
import 'package:yummy/view/widgets/auth/auth_card.dart';
import 'package:yummy/view/widgets/auth/auth_logo.dart';
import 'package:yummy/view/widgets/auth/auth_heading.dart';
import 'package:yummy/view/widgets/auth/auth_input_field.dart';
import 'package:yummy/view/widgets/auth/auth_button.dart';
import 'package:yummy/view/widgets/auth/auth_divider.dart';
import 'package:yummy/view/widgets/auth/auth_google_button.dart';
import 'package:yummy/view_model/sign_in_view_model.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

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
            child: Consumer<SignInViewModel>(
              builder: (context, viewModel, _) {
                return AuthCard(
                  imageRadius: imageRadius,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const AuthLogo(height: 90),
                      const SizedBox(height: 16),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Serif',
                            ),
                            children: [
                              const TextSpan(text: 'Welcome to '),
                              TextSpan(
                                text: 'Yummy',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontFamily: 'Serif',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      AuthInputField(
                        labelText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        onChanged: viewModel.setEmail,
                      ),
                      const SizedBox(height: 16),
                      AuthInputField(
                        labelText: 'Password',
                        obscureText: true,
                        onChanged: viewModel.setPassword,
                      ),
                      const SizedBox(height: 24),
                      if (viewModel.errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Text(
                            viewModel.errorMessage!,
                            style: const TextStyle(color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      AuthButton(
                        text: viewModel.isLoading ? 'Signing In...' : 'Sign In',
                        onPressed: viewModel.isValid && !viewModel.isLoading
                            ? () async {
                                await viewModel.signIn();
                                if (viewModel.user != null) {
                                  Navigator.pushReplacementNamed(context, '/home');
                                }
                              }
                            : null,
                      ),
                      const SizedBox(height: 18),
                      const AuthDivider(),
                      const SizedBox(height: 18),
                      Center(
                        child: AuthGoogleButton(
                          onTap: () {
                            // TODO: Implement Google sign-in
                          },
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/sign-up');
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
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
                    AppAssets.signin,
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