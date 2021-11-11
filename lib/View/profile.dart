import 'package:flutter/material.dart';
import 'package:parasut_ziddioglu/Provider/authStatus.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userDetails = Provider.of<AuthStatus>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              userDetails.logOut();
            },
            child: Text(
              "X",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.black),
            ),
          )
        ],
        title: Column(
          children: [
            Text(userDetails.getUserName()),
            Text(userDetails.getEmail()),
          ],
        ),
      ),
    );
  }
}

// Center(
// child: TextButton(
// onPressed: () {},
// child: Text(
// "Logout",
// style: TextStyle(
// fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
// ),
// ),
// );
