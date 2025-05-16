import 'package:flutter/material.dart';
import '../data/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeViewModel extends ChangeNotifier {
  List<Map<String, String>> _popularRecipes = [];
  List<Map<String, String>> _latestRecipes = [];
  bool _isLoading = false;
  String? _errorMessage;
  final AuthRepository _authRepository;
  User? _user;
  late final Stream<User?> _authStateStream;

  List<Map<String, String>> get popularRecipes => _popularRecipes;
  List<Map<String, String>> get latestRecipes => _latestRecipes;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  User? get user => _user;

  HomeViewModel({AuthRepository? authRepository}) : _authRepository = authRepository ?? AuthRepository() {
    _authStateStream = _authRepository.authStateChanges;
    _authStateStream.listen((user) {
      _user = user;
      notifyListeners();
    });
    fetchRecipes();
  }

  Future<void> fetchRecipes() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    // Mock data
    _popularRecipes = [
      {'title': 'Friedrice cake', 'image': 'assets/images/food1.png'},
      {'title': 'Classic Victoria', 'image': 'assets/images/food2.png'},
      {'title': 'Pasta and Ricotta', 'image': 'assets/images/food3.png'},
    ];
    _latestRecipes = [
      {'title': 'Classic Victoria', 'image': 'assets/images/food2.png'},
      {'title': 'Pasta and Ricotta', 'image': 'assets/images/food3.png'},
      {'title': 'Friedrice cake', 'image': 'assets/images/food1.png'},
    ];
    _isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    await fetchRecipes();
  }

  void setError(String? error) {
    _errorMessage = error;
    notifyListeners();
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
  }
} 