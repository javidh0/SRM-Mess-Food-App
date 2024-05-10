import 'package:mess_food_app/utils/date.dart';

import '../screens/welcome.dart';

List<DayCard> getDayCard() {
  List<DayCard> dayCards = [];
  List<List> data = getDateTime();
  for (int i = 0; i < 7; i++) {
    var temp = DayCard(
      color: data[i][3],
      date: [data[i][2], data[i][1]],
      day: data[i][0],
      dayNo: data[i][4],
    );
    dayCards.add(temp);
  }
  return dayCards;
}
