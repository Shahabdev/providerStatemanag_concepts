import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class Dark_Provider with ChangeNotifier
{
  var _darkmode=ThemeMode.light;
  ThemeMode get darkMode => _darkmode;
  void setMod ( darkmode)
  {
    _darkmode=darkmode;
    notifyListeners();
  }

}