// lib/view_model/onboarding_view_model.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingViewModel extends ChangeNotifier {
  int _currentPage = 0;
  bool _hasSeenOnboarding = false;
  
  // Keys for saving preferences
  static const String _hasSeenOnboardingKey = 'has_seen_onboarding';

  // Getters
  int get currentPage => _currentPage;
  bool get hasSeenOnboarding => _hasSeenOnboarding;

  // Constructor - check if user has already seen onboarding
  OnboardingViewModel() {
    _checkOnboardingStatus();
  }

  // Check if user has already seen onboarding screens
  Future<void> _checkOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _hasSeenOnboarding = prefs.getBool(_hasSeenOnboardingKey) ?? false;
    notifyListeners();
  }

  // Update the current page index
  void setCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  // Mark onboarding as completed
  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hasSeenOnboardingKey, true);
    _hasSeenOnboarding = true;
    notifyListeners();
  }
}