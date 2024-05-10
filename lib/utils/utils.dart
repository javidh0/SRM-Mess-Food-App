import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mess_food_app/utils/selection_provider.dart';
import 'package:provider/provider.dart';

import 'data.dart';
import 'package:http/http.dart' as http;

String getSelectedDay(BuildContext context) {
  return dateMap[context.watch<Selection>().selectedDay]!;
}

class API {
  final uri =
      "https://firebasestorage.googleapis.com/v0/b/srm-mess-app.appspot.com/o/data.json?alt=media";

  dynamic getMenu() async {
    final url = Uri.parse(uri);
    var res = await http.get(url);
    var data = jsonDecode(res.body);

    return data;
  }
}
