import 'package:flutter/material.dart';

class WeatherProvider extends ChangeNotifier {
  bool isLoaded = false;

  void changeValue(bool value) {
    isLoaded = value;
    notifyListeners();
  }
}
