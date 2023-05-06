import 'package:flutter/material.dart';

class FilteringChangeNotifier extends ChangeNotifier {
  bool _fullCheck = true;
  bool _halfFullCheck = true;
  bool _emptyCheck = true;
  bool _driversCheck = true;

  bool get fullCheck => _fullCheck;
  bool get halfFullCheck => _halfFullCheck;
  bool get emptyCheck => _emptyCheck;
  bool get driversCheck => _driversCheck;

  set fullCheck(bool newValue) {
    _fullCheck = newValue;
    notifyListeners();
  }

  set halfFullCheck(bool newValue) {
    _halfFullCheck = newValue;
    notifyListeners();
  }

  set emptyCheck(bool newValue) {
    _emptyCheck = newValue;
    notifyListeners();
  }

  set driversCheck(bool newValue) {
    _driversCheck = newValue;
    notifyListeners();
  }
}
