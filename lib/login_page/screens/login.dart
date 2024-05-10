import 'package:flutter/material.dart';
import 'package:mess_food_app/utils/colors.dart';

import 'widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: kColorBackground_1,
        body: LoginPageWidget(),
      ),
    );
  }
}
