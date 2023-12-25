import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NavigationbarVisible extends ChangeNotifier {
  bool _isVisible = true;

  bool get isVisible => _isVisible;

  set isVisible(bool value) {
    _isVisible = value;
    notifyListeners();
  }
}
