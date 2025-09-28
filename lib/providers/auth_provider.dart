import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  User? get user => _auth.currentUser;
  bool get isLoggedIn => user != null;

  Future<void> restoreSession() async {
    // Firebase restaura sesión automáticamente. Puedes leer extras del storage si los guardas.
    notifyListeners();
  }

  Future<String?> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      notifyListeners();
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('last_email', email);
      notifyListeners();
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    notifyListeners();
  }
}
