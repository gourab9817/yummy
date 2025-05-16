import 'package:flutter/material.dart';

class SignUpViewModel extends ChangeNotifier {
  String _name = '';
  String _email = '';
  String _password = '';
  bool _isLoading = false;
  String? _errorMessage;

  String get name => _name;
  String get email => _email;
  String get password => _password;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void setName(String value) {
    _name = value;
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  bool get isValid => _name.isNotEmpty && _email.isNotEmpty && _password.length >= 6 && _email.contains('@');

  Future<void> signUp() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    if (_email.endsWith('@example.com')) {
      // Success (simulate)
      _isLoading = false;
      notifyListeners();
    } else {
      _isLoading = false;
      _errorMessage = 'Sign up failed. Use an @example.com email.';
      notifyListeners();
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
} 