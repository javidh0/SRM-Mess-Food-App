import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mess_food_app/time_page/utils/functions.dart';
import 'package:mess_food_app/utils/colors.dart';
import 'package:mess_food_app/utils/functions.dart';
import 'package:mess_food_app/utils/icons.dart';
import 'package:mess_food_app/utils/selection_provider.dart';
import 'package:mess_food_app/utils/text.dart';
import 'package:mess_food_app/utils/utils.dart';
import 'package:provider/provider.dart';

class TimePage extends StatelessWidget {
  const TimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: TimeAppBar(),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: getHeight(context, 90),
            child: Column(
              children: getTimeCard(),
            ),
          ),
        ),
      ),
    );
  }
}

class TimeAppBar extends StatelessWidget {
  const TimeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kColorPrimary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          children: [
            const Icon(
              kIconEvent,
              size: 30,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            AutoSizeText(
              getSelectedDay(context),
              maxLines: 1,
              maxFontSize: 27,
              style: kTextPrimiaryBig.copyWith(),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeCard extends StatefulWidget {
  const TimeCard({
    super.key,
    required this.name,
    required this.time,
    required this.i,
  });

  final String name, time;
  final int i;

  @override
  State<TimeCard> createState() => _TimeCardState();
}

class _TimeCardState extends State<TimeCard>
    with SingleTickerProviderStateMixin {
  double x = 2, y = 2;
  Color buttonClr = const Color.fromRGBO(253, 239, 255, 1);
  late AnimationController controller;
  late CurvedAnimation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 1),
      lowerBound: 2,
      upperBound: 8,
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
      reverseCurve: Curves.linear,
    );
    controller.addListener(() {
      setState(() {
        x = controller.value;
        y = controller.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: GestureDetector(
        onTap: () {
          controller.forward();
          controller.reverse(from: 8);
          context.read<Selection>().selectTime(widget.i + 1);

          Navigator.pushNamed(context, '/menu_page');
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: buttonClr,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                offset: Offset(x, y),
                blurRadius: 3,
                color: kColorSecondary,
              ),
            ],
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: kColorSecondary,
                radius: 25,
                backgroundImage: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/srm-mess-app.appspot.com/o/${widget.i + 1}.png?alt=media',
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    widget.name,
                    maxLines: 1,
                    maxFontSize: 25,
                    style: kTextPrimiaryBig.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  AutoSizeText(
                    "Time: ${widget.time}",
                    maxLines: 1,
                    maxFontSize: 15,
                    minFontSize: 5,
                    style: kTextPrimiarySmall.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: AutoSizeText(
                  ">",
                  maxLines: 1,
                  textAlign: TextAlign.end,
                  style: kTextPrimiaryBig.copyWith(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
