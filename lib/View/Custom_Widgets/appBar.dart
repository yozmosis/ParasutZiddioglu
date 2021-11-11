import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({required this.pageName});

  final String pageName;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.deepOrange,
      title: Text(pageName),
    );
  }

  @override
  Size get preferredSize {
    return new Size.fromHeight(60.0);
  }
}
