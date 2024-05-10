import 'data.dart';

List<List> getDateTime() {
  var now = DateTime.now();
  List<List> dateTr = [];
  for (int i = 0; i < 7; i++) {
    String? day = dateMap[now.add(Duration(days: i)).weekday];
    String? month = monthMap[now.add(Duration(days: i)).month];
    String? date = now.add(Duration(days: i)).day.toString();
    if (i == 0) day = "Today's Menu";

    dateTr.add([
      day,
      month,
      date,
      clr[i],
      now.add(Duration(days: i)).weekday,
    ]);
  }
  return dateTr;
}

Map<int, String> dateMap = {
  1: "Monday",
  2: "Tuesday",
  3: "Wednesday",
  4: "Thursday",
  5: "Friday",
  6: "Saturday",
  7: "Sunday",
};
