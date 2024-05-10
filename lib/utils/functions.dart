import 'package:flutter/material.dart';

double getHeight(BuildContext context, double percentage) {
  return MediaQuery.of(context).size.height * percentage / 100;
}

double getWidth(BuildContext context, double percentage) {
  return MediaQuery.of(context).size.width * percentage / 100;
}
