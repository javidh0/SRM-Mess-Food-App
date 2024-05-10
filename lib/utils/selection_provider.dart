import 'package:flutter/material.dart';

class Selection extends ChangeNotifier {
  int selectedDay = 1, selectedTime = 1;

  void selectDay(int day) {
    selectedDay = day;
    notifyListeners();
  }

  void selectTime(int time) {
    selectedTime = time;
  }
}
