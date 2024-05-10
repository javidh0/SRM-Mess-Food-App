import 'package:flutter/material.dart';
import 'package:mess_food_app/utils/selection_provider.dart';
import 'package:mess_food_app/utils/utils.dart';
import 'package:provider/provider.dart';

List<String> time = [
  "7:00-9:00",
  "11:30-1:00",
  "4:30-5:30",
  "7:00-9:00",
];

const List<String> name = [
  "Breakfast",
  "Lunch",
  "Snacks",
  "Dinner",
];

const Map<int, String> dateMap = {
  1: "Monday",
  2: "Tuesday",
  3: "Wednesday",
  4: "Thursday",
  5: "Friday",
  6: "Saturday",
  7: "Sunday",
};

const Map<int, String> monthMap = {
  1: "Jan",
  2: "Feb",
  3: 'Mar',
  4: "Apr",
  5: "May",
  6: "Jun",
  7: "Jul",
  8: "Aug",
  9: "Sep",
  10: "Oct",
  11: "Nov",
  12: "Dec"
};

const List<Color> clr = [
  Color.fromRGBO(250, 224, 255, 1),
  Color.fromRGBO(255, 166, 166, 1),
  Color.fromRGBO(193, 227, 159, 1),
  Color.fromRGBO(150, 230, 230, 1),
  Color.fromRGBO(255, 166, 166, 1),
  Color.fromRGBO(246, 248, 168, 1),
  Color.fromRGBO(255, 166, 166, 1),
  Color.fromRGBO(162, 150, 230, 1),
  Color.fromRGBO(149, 145, 195, 1),
];

// -----------------------------------------

Map<int, List> breakfast = {
  1: ["Chappati", "Breakfast", "Mon"],
  2: ["Chappati", "Breakfast", "Tue"],
  3: ["Chappati", "Breakfast", "Wed"],
  4: ["Chappati", "Breakfast", "Thurs"],
  5: ["Chappati", "Breakfast", "Fri"],
  6: ["Chappati", "Breakfast", "Sat"],
  7: ["Chappati", "Breakfast", "Sun"],
};

Map<int, List> lunch = {
  1: ["Chappati", "Lunch", "Mon"],
  2: ["Chappati", "Lunch", "Tue"],
  3: ["Chappati", "Lunch", "Wed"],
  4: ["Chappati", "Lunch", "Thurs"],
  5: ["Chappati", "Lunch", "Fri"],
  6: ["Chappati", "Lunch", "Sat"],
  7: ["Chappati", "Lunch", "Sun"],
};

Map<int, List> snacks = {
  1: ["Chappati", "Snacks", "Mon"],
  2: ["Chappati", "Snacks", "Tue"],
  3: ["Chappati", "Snacks", "Wed"],
  4: ["Chappati", "Snacks", "Thurs"],
  5: ["Chappati", "Snacks", "Fri"],
  6: ["Chappati", "Snacks", "Sat"],
  7: ["Chappati", "Snacks", "Sun"],
};

Map<int, List> dinner = {
  1: ["Chappati", "Dinner", "Mon"],
  2: ["Chappati", "Dinner", "Tue"],
  3: ["Chappati", "Dinner", "Wed"],
  4: ["Chappati", "Dinner", "Thurs"],
  5: ["Chappati", "Dinner", "Fri"],
  6: ["Chappati", "Dinner", "Sat"],
  7: ["Chappati", "Dinner", "Sun"],
};

Map<int, Map<int, List<dynamic>>> menu = {
  1: breakfast,
  2: lunch,
  3: snacks,
  4: dinner,
};

class Data {
  // ignore: prefer_typing_uninitialized_variables
  var menu;
  load() async {
    if (menu != null) return menu;
    menu = await API().getMenu();
    menu = menu['menu'];
    return menu;
  }

  getMenu() {
    return menu;
  }

  List getSelectedMenu(BuildContext context) {
    var menuData = menu[context.watch<Selection>().selectedTime.toString()];
    return menuData![context.watch<Selection>().selectedDay.toString()]!;
  }
}

Data data = Data();
