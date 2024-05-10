import 'package:flutter/material.dart';
import 'package:mess_food_app/time_page/screens/time_page.dart';
import 'package:mess_food_app/utils/data.dart';

List<Widget> getTimeCard() {
  List<Widget> tr = [];
  for (int i = 0; i < 4; i++) {
    Widget temp = TimeCard(
      name: name[i],
      time: time[i],
      i: i,
    );
    tr.add(temp);
  }

  return tr;
}
