import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../enlargedImage.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(EnlargedImage.routeName, arguments: url);
      },
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(this.url),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        height: 200,
        width: 200,
      ),
    );
  }
}
