import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SinglePic {
  final String urlString;

  SinglePic({required this.urlString});
}

class Pictures with ChangeNotifier {
  List<SinglePic> _allPics = [];

  List<SinglePic> get allPics {
    return [..._allPics];
  }

  Future<void> fetchPics(html) async {
    _allPics = [];
    final url = Uri.parse(html);

    final response = await http.get(url);
    final List<SinglePic> loadedPics = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>?;

    if (extractedData == null) {
      return;
    }

    extractedData["photos"].forEach((picValue) {
      loadedPics.add(SinglePic(urlString: picValue['img_src']));
    });

    _allPics = loadedPics;
    notifyListeners();
  }
}
