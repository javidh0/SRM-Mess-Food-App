import 'package:flutter/material.dart';
import 'package:mess_food_app/intro/widgets/widgets.dart';
import 'package:mess_food_app/utils/colors.dart';
import 'package:mess_food_app/welcome_screen/screens/welcome.dart';

class IntoPage extends StatefulWidget {
  const IntoPage({super.key});

  @override
  State<IntoPage> createState() => _IntoPageState();
}

class _IntoPageState extends State<IntoPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool load = true;
  late Animation animation;
  double value = 0.8;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
      lowerBound: 0.55,
      upperBound: 1,
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );

    controller.forward();
    controller.addListener(() {
      setState(() {
        value = animation.value;
      });
    });
    Future.delayed(const Duration(seconds: 3, milliseconds: 0), () {
      setState(() {
        load = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return load
        ? Scaffold(
            backgroundColor: kColorBackground_1,
            body: IntoPageWidget(value: value),
          )
        : const WelcomePage();
  }
}
