import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  List<Map<String, String>> _popularRecipes = [];
  List<Map<String, String>> _latestRecipes = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Map<String, String>> get popularRecipes => _popularRecipes;
  List<Map<String, String>> get latestRecipes => _latestRecipes;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  HomeViewModel() {
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
} 