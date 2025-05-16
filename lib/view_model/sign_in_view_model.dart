import 'package:flutter/material.dart';
import '../data/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;

  SignInViewModel({AuthRepository? authRepository}) : _authRepository = authRepository ?? AuthRepository();

  String _email = '';
  String _password = '';
  bool _isLoading = false;
  String? _errorMessage;
  User? _user;

  String get email => _email;
  String get password => _password;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  User? get user => _user;

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
    try {
      _user = await _authRepository.signIn(_email, _password);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
} 