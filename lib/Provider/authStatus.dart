import 'package:flutter/material.dart';

class AuthStatus with ChangeNotifier {
  bool _loggedIn = false;

  String _userName = "";

  String _userEmail = "";

  String getUserName() {
    return this._userName;
  }

  String getEmail() {
    return this._userEmail;
  }

  void setUser(name, email) {
    this._userName = name;
    this._userEmail = email;
    loggedInStatus();
  }

  void loggedInStatus() {
    this._loggedIn = true;
    notifyListeners();
  }

  void loggedOutStatus() {
    this._loggedIn = false;
    notifyListeners();
  }

  bool getLoginStatus() {
    return this._loggedIn;
  }

  void logOut() {
    this._loggedIn = false;
    notifyListeners();
  }
}
