// lib/routes/app_router.dart
import 'package:flutter/material.dart';
import 'package:yummy/view/screens/Home/home_screen.dart';
import 'package:yummy/view/screens/onboarding/onboarding_screen.dart';
import 'package:yummy/view/screens/splash/splash_screen.dart';
import 'package:yummy/view/screens/auth/sign_in_screen.dart';
import 'package:yummy/view/screens/auth/sign_up_screen.dart';
import 'package:yummy/view/screens/auth/verify_phone_screen.dart';
import 'package:yummy/view/screens/auth/verify_keyboard_screen.dart';
import 'package:yummy/view/screens/auth/verify_code_screen.dart';

class AppRouter {
  static const String splashRoute = '/';
  static const String onboardingRoute = '/onboarding';
  static const String homeRoute = '/home';
  static const String signInRoute = '/sign-in';
  static const String signUpRoute = '/sign-up';
  static const String verifyPhoneRoute = '/verify-phone';
  static const String verifyKeyboardRoute = '/verify-keyboard';
  static const String verifyCodeRoute = '/verify-code';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case onboardingRoute:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case signInRoute:
        return MaterialPageRoute(
          builder: (_) => const SignInScreen(),
        );
      case signUpRoute:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case verifyPhoneRoute:
        return MaterialPageRoute(
          builder: (_) => const VerifyPhoneScreen(),
        );
      case verifyKeyboardRoute:
        return MaterialPageRoute(
          builder: (_) => const VerifyKeyboardScreen(),
        );
      case verifyCodeRoute:
        return MaterialPageRoute(
          builder: (_) => const VerifyCodeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}