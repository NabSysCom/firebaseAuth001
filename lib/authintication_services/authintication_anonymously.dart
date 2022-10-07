import 'package:firebase_auth/firebase_auth.dart';
import 'package:flatterfire/authintication_services/authintication_status.dart';

class AuthinticationAninymously extends AuthinticationStatus {
  Future<dynamic> signInAnonymously(
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }
}
