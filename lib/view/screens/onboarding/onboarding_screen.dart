// lib/view/screens/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:yummy/core/theme/app_colors.dart';
import 'package:yummy/routes/app_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<_OnboardingPageData> _pages = [
    _OnboardingPageData(
      backgroundColor: Color(0xFF4058A0),
      images: [
        'assets/images/splashicon1.png',
        'assets/images/splashicon2.png',
        'assets/images/splashicon3.png',
      ],
      text: 'Your personal guide to be a chef',
      buttonText: '',
    ),
    _OnboardingPageData(
      backgroundColor: Color(0xFFFF6339),
      images: [
        'assets/images/splashicon4.png',
        'assets/images/splashicon5.png',
        'assets/images/splashicon6.png',
      ],
      text: 'Share the Love.\nShare the Recipe',
      buttonText: '',
    ),
    _OnboardingPageData(
      backgroundColor: Color(0xFFDEE21B),
      images: [
        'assets/images/splashicon2.png',
        'assets/images/splashicon3.png',
        'assets/images/splashicon1.png',
      ],
      text: 'Yummy Your\nGlobal Kitchen',
      buttonText: 'Go',
    ),
  ];

  void _onNext() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, AppRouter.signInRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          final page = _pages[index];
          final isLast = index == _pages.length - 1;
          return Container(
            color: page.backgroundColor,
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  // Images
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: page.images.map((img) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.asset(
                            img,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )).toList(),
                    ),
                  ),
                  // Text in black rounded rectangle
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                      child: Center(
                        child: Text(
                          page.text,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Serif',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  // Bottom button
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32, top: 8),
                    child: GestureDetector(
                      onTap: _onNext,
                      child: Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: isLast ? Colors.white : Colors.transparent,
                          border: Border.all(color: Colors.white, width: 3),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: isLast
                              ? const Text('Go', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18))
                              : Icon(Icons.arrow_forward, color: Colors.white, size: 28),
                        ),
                      ),
                    ),
                  ),
                  // Page indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_pages.length, (dot) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: dot == _currentPage ? Colors.white : Colors.white.withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                    )),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _OnboardingPageData {
  final Color backgroundColor;
  final List<String> images;
  final String text;
  final String buttonText;
  _OnboardingPageData({
    required this.backgroundColor,
    required this.images,
    required this.text,
    required this.buttonText,
  });
}