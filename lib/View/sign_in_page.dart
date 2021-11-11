import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parasut_ziddioglu/Provider/authStatus.dart';
import 'package:provider/provider.dart';
import 'Custom_Widgets/custom_raised_button.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key, required this.onSignIn}) : super(key: key);

  final void Function(User) onSignIn;

  Future<void> _signInAnonymously() async {
    try {
      final userCredentials = await FirebaseAuth.instance.signInAnonymously();
      onSignIn(userCredentials.user!);
      print("${userCredentials.user!.uid}");
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Rover Pics'),
        elevation: 4.0,
        centerTitle: true,
      ),
      body: _buildContainer(context),
    );
  }

  Widget _buildContainer(context) {
    final loginDetails = Provider.of<AuthStatus>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/rocket2.jpg"), fit: BoxFit.fitHeight),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomRaisedButton(
              onPressed: () async {
                final result = await FacebookAuth.i
                    .login(permissions: ["public_profile", "email"]);

                if (result.status == LoginStatus.success) {
                  final requestData = await FacebookAuth.i.getUserData(
                    fields: "email, name",
                  );

                  loginDetails.setUser(requestData["name"].toString(),
                      requestData["email"].toString());
                  print(loginDetails.getUserName());
                }
              },
              color: Colors.blue,
              borderRadius: 4.0,
              child: Row(
                children: [
                  Image.asset("images/facebook-logo.png"),
                  SizedBox(width: 70),
                  Text(
                    "Sign in with Facebook",
                    style: TextStyle(color: Colors.black87, fontSize: 15.0),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 8.0),
            // CustomRaisedButton(
            //   onPressed: _signInAnonymously,
            //   color: Colors.deepOrange,
            //   borderRadius: 4.0,
            //   child: Text(
            //     "Sign in anonymously",
            //     style: TextStyle(color: Colors.black87, fontSize: 15.0),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
