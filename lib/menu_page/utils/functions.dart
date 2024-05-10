import 'package:flutter/material.dart';
import 'package:mess_food_app/menu_page/screen/menu_page.dart';

List<Widget> getMenuCards(List menu) {
  List<Widget> tr = [];
  for (int i = 0; i < menu.length; i++) {
    Widget temp = FoodCard(name: menu[i]);
    tr.add(temp);
  }
  tr.add(
    const SizedBox(
      height: 20,
    ),
  );
  return tr;
}
