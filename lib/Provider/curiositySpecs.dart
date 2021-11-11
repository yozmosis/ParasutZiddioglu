import 'package:flutter/material.dart';

class CuriositySpecs with ChangeNotifier {
  late int _sol;
  late int _page;
  late String _html;
  String _camera = "";

  CuriositySpecs(sol, page) {
    this._sol = int.parse(sol);
    this._page = int.parse(page);
    this._html =
        'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=$sol&page=$page&api_key=Q2AvaIwfyHdltYrMu8m2BcSXzTrXcDkSKwsKbkFp';
  }

  List<String> _cameras = [
    "fhaz",
    "rhaz",
    "mast",
    "chemcam",
    "mahli",
    "mardi",
    "navcam",
    ""
  ];

  List<String> getCameraList() {
    return this._cameras;
  }

  void setCamera(cameraType) {
    this._camera = cameraType;
    setHtml();
  }

  void setHtml() {
    if (this._camera == "") {
      this._html =
          "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=${this._sol}&page=${this._page}&api_key=Q2AvaIwfyHdltYrMu8m2BcSXzTrXcDkSKwsKbkFp";
    } else {
      this._html =
          "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=${this._sol}&camera=${this._camera}&page=${this._page}&api_key=Q2AvaIwfyHdltYrMu8m2BcSXzTrXcDkSKwsKbkFp";
    }
    notifyListeners();
  }

  void setSol(sol) {
    this._sol = int.parse(sol);
    this._html =
        'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=$sol&page=${this._page}&api_key=Q2AvaIwfyHdltYrMu8m2BcSXzTrXcDkSKwsKbkFp';
    notifyListeners();
  }

  void setPage(page) {
    this._page = int.parse(page);
    this._html =
        'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=${this._sol}&page=$page&api_key=Q2AvaIwfyHdltYrMu8m2BcSXzTrXcDkSKwsKbkFp';
    notifyListeners();
  }

  String getHtml() {
    return this._html;
  }
}
