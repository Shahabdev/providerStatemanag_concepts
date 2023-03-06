import 'package:flutter/material.dart';
class  Counter_Provider with ChangeNotifier{
  int _count=0;
  int get count=> _count;
  void setcount()
  {
    _count++;
    notifyListeners();
  }

}