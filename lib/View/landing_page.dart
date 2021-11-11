import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parasut_ziddioglu/Provider/authStatus.dart';
import 'package:parasut_ziddioglu/View/sign_in_page.dart';
import 'package:provider/provider.dart';

import 'bottomBar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User? _user;

  void _updateUser(User user) {
    print("User id: ${user.uid}");
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool loginStatus = Provider.of<AuthStatus>(context).getLoginStatus();

    if (loginStatus != true) {
      return SignInPage(
        onSignIn: _updateUser,
      );
    }

    return BottomBar();
  }
}
