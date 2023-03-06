import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

class Login_provider with ChangeNotifier {
  bool _loading = false;
 bool get loading => _loading;
  setloading(bool value)
  {
    _loading=value;
    notifyListeners();
  }
  void login(String email, String passward) async {
    setloading(true);
    try {
      Response response = await post(
          Uri.parse('https://reqres.in/https:/reqres.in/api/login'),
          body: {'email': email, 'passward': passward});
      if (response.statusCode == 200) {
        print("success");
        setloading(false);

      } else {
        setloading(false);
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
