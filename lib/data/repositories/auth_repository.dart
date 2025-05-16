import '../services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository({AuthService? authService}) : _authService = authService ?? AuthService();

  Stream<User?> get authStateChanges => _authService.authStateChanges;

  Future<User?> register(String email, String password) {
    return _authService.signUpWithEmail(email, password);
  }

  Future<User?> signIn(String email, String password) {
    return _authService.signInWithEmail(email, password);
  }

  Future<void> signOut() {
    return _authService.signOut();
  }

  User? get currentUser => _authService.currentUser;
} 