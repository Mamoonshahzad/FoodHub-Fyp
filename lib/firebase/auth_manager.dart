import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('userId', user.uid);
        prefs.setString('email', user.email!);
        return true;
      }
    } catch (e) {
      // Handle login error
      print('Login Error: $e');
    }
    // Return false to indicate login failure
    return false;
  }

  Future<bool> registerUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('userId', user.uid);
        prefs.setString('email', user.email!);
        return true;
      }
    } catch (e) {
      print('Registration Error: $e');
    }

    return false;
  }
}
