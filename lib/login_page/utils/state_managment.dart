import 'package:flutter/material.dart';

class LoginPageData extends ChangeNotifier {
  bool active = true;
  String emailId = '', password = '';
  void changeActive(bool active) {
    this.active = active;
    notifyListeners();
  }

  void onChangeEmail(String value) {
    emailId = value;
  }

  void onChangePass(String value) {
    password = value;
  }
}
