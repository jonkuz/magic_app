import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlayerHealth extends ChangeNotifier {
  int _health = 40;
  int _shield = 0;

  int get health => _health;
  int get shield => _shield;

  set health(int value) {
    _health = value;
    notifyListeners();
  }

  set shield(int value) {
    _shield = value;
    notifyListeners();
  }

  void resetShield() {
    _shield = 40;
    notifyListeners();
  }

  void increment() {
    _health++;
    notifyListeners();
  }

  void decrement() {
    _health--;
    notifyListeners();
  }

  void resetHealth() {
    _health = 40;
    notifyListeners();
  }
}
