import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Shield extends ChangeNotifier {
  int _shield = 40;

  int get shield => _shield;

  set shield(int value) {
    _shield = value;
    notifyListeners();
  }

  void increment() {
    _shield++;
    notifyListeners();
  }

  void resetShield() {
    _shield = 40;
    notifyListeners();
  }
}
