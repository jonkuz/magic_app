import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlayerHealth extends ChangeNotifier {
  int _health = 40;

  int get health => _health;

  set health(int value) {
    _health = value;
    notifyListeners();
  }

  void increment() {
    _health++;
    notifyListeners();
  }

  void resetHealth() {
    _health = 40;
    notifyListeners();
  }
}
