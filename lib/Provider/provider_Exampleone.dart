import 'package:flutter/foundation.dart';
class Example_oneProvider with ChangeNotifier
{
  double _value=1.0;
  double get values => _value;
  void setvalue(double val)
  {
    _value=val;
    notifyListeners();
  }
}