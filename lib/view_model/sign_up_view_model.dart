import 'package:flutter/material.dart';
import '../data/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;

  SignUpViewModel({AuthRepository? authRepository}) : _authRepository = authRepository ?? AuthRepository();

  String _name = '';
  String _email = '';
  String _password = '';
  bool _isLoading = false;
  String? _errorMessage;
  User? _user;

  String get name => _name;
  String get email => _email;
  String get password => _password;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  User? get user => _user;

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
    try {
      _user = await _authRepository.register(_email, _password);
      if (_user != null) {
        await FirebaseFirestore.instance.collection('users').doc(_user!.uid).set({
          'name': _name,
          'email': _email,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }
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