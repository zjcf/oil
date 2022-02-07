import 'package:flutter/material.dart';

class Model extends ChangeNotifier
{
  bool isActive = false;

  toggleActive () {
    isActive = !isActive;
    notifyListeners();
  }
}