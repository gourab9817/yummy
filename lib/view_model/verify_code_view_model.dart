import 'package:flutter/material.dart';

class VerifyCodeViewModel extends ChangeNotifier {
  String _code = '';
  bool _isLoading = false;
  String? _errorMessage;

  String get code => _code;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void setCode(String value) {
    _code = value;
    notifyListeners();
  }

  bool get isValid => _code.length == 4;

  Future<void> verifyCode() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    if (_code == '1234') {
      // Success (simulate)
      _isLoading = false;
      notifyListeners();
    } else {
      _isLoading = false;
      _errorMessage = 'Invalid code.';
      notifyListeners();
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
} 