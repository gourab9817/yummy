import 'package:flutter/material.dart';

class VerifyPhoneViewModel extends ChangeNotifier {
  String _phone = '';
  String _countryCode = '+91';
  bool _isLoading = false;
  String? _errorMessage;

  String get phone => _phone;
  String get countryCode => _countryCode;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void setPhone(String value) {
    _phone = value;
    notifyListeners();
  }

  void setCountryCode(String value) {
    _countryCode = value;
    notifyListeners();
  }

  bool get isValid => _phone.length >= 10 && _countryCode.isNotEmpty;

  Future<void> sendVerification() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    if (_phone.startsWith('9')) {
      // Success (simulate)
      _isLoading = false;
      notifyListeners();
    } else {
      _isLoading = false;
      _errorMessage = 'Invalid phone number.';
      notifyListeners();
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
} 