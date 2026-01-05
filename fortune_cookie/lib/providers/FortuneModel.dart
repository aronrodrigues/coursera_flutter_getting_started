import 'dart:math';

import 'package:flutter/material.dart';

class FortuneModel with ChangeNotifier {
  String _currentFortune = "";

  String get currentFortune => _currentFortune;

  final _fortuneList = [
    "Be your best",
    "You will find a friend",
    "You can do it",
    "Keep the focus",
  ];

  FortuneModel() {
    generateRandomFortune();
  }

  void generateRandomFortune() {
    int random = Random().nextInt(_fortuneList.length);
    _currentFortune = _fortuneList[random];
    notifyListeners();
  }
}
