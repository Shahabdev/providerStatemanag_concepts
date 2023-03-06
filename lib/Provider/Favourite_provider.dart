import 'package:flutter/foundation.dart';
class FavouiteitemProvider with  ChangeNotifier
{
  List<int> _items = [];
  List<int> get favriteitem => _items;
  void   removeitem (int value)
  {
    _items.remove(value);
    notifyListeners();
  }
  void additems(int item)
  {
    _items.add(item);
    notifyListeners();
  }

}