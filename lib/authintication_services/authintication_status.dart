import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum ApplicationStatus {
  loggedOut,
  loggedIn,
  checking,
}

class AuthinticationStatus extends ChangeNotifier {
  ApplicationStatus loginState = ApplicationStatus.checking;
  User? _userProfile;
  User? get userProfile => _userProfile;

  AuthinticationStatus() {
    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        loginState = ApplicationStatus.loggedOut;
      } else {
        _userProfile = user;
        loginState = ApplicationStatus.loggedIn;
      }
      notifyListeners();
    });
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
