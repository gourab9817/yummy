import 'package:flutter/material.dart';

class SignInViewModel extends ChangeNotifier {
  String _email = '';
  String _password = '';
  bool _isLoading = false;
  String? _errorMessage;

  String get email => _email;
  String get password => _password;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  bool get isValid => _email.isNotEmpty && _password.isNotEmpty && _email.contains('@');

  Future<void> signIn() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    if (_email == 'test@example.com' && _password == 'password') {
      // Success (simulate)
      _isLoading = false;
      notifyListeners();
    } else {
      _isLoading = false;
      _errorMessage = 'Invalid email or password';
      notifyListeners();
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
} 