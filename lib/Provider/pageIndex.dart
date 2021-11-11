import 'package:flutter/material.dart';

class PageIndex with ChangeNotifier {
  int _myPageIndex = 0;

  int get myPageIndex {
    return _myPageIndex;
  }

  void setPageIndex(int i) {
    _myPageIndex = i;
    notifyListeners();
  }
}
