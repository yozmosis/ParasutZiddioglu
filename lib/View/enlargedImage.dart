import 'package:flutter/material.dart';

class EnlargedImage extends StatelessWidget {
  static const routeName = '/enlargedImage';

  @override
  Widget build(BuildContext context) {
    final imgUrl = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imgUrl), fit: BoxFit.contain),
          ),
        ));
  }
}
