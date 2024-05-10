import 'package:flutter/material.dart';
import 'package:mess_food_app/utils/colors.dart';
import 'package:mess_food_app/utils/functions.dart';
import 'package:mess_food_app/utils/icons.dart';
import 'package:mess_food_app/utils/selection_provider.dart';
import 'package:mess_food_app/utils/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:mess_food_app/welcome_screen/utils/functions.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kColorBackground,
        body: Padding(
          padding: const EdgeInsets.only(right: 30, left: 30),
          child: Center(
            child: SizedBox(
              height: getHeight(context, 98),
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const UserCard(
                        name: "Guest User",
                        hostel: "--",
                        regNo: "--",
                      ),
                      Column(
                        children: getDayCard(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.name,
    required this.hostel,
    required this.regNo,
  });

  final String name, hostel, regNo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getHeight(context, 3)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: kColorSecondary,
              child: Icon(kIconAvatar, size: 65),
            ),
            SizedBox(
              width: getWidth(context, 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    name,
                    maxFontSize: 25,
                    minFontSize: 15,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kTextSecondaryBig.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                  AutoSizeText(
                    hostel,
                    style: kTextSecondarySmall.copyWith(
                      fontSize: 15,
                      color: kColorSecondary_2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  AutoSizeText(
                    regNo,
                    style: kTextSecondarySmall.copyWith(
                      fontSize: 15,
                      color: kColorSecondary_2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: getHeight(context, 3)),
      ],
    );
  }
}

class DayCard extends StatelessWidget {
  const DayCard({
    super.key,
    required this.color,
    required this.date,
    required this.day,
    required this.dayNo,
  });

  final Color color;
  final List<String> date;
  final String day;
  final int dayNo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          context.read<Selection>().selectDay(dayNo);
          Navigator.pushNamed(context, '/time_page');
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          width: getWidth(context, 90),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 3,
                color: kColorSecondary,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                width: 80,
                decoration: BoxDecoration(
                  color: kColorBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    AutoSizeText(
                      date[0],
                      maxLines: 1,
                      style: kTextSecondaryBig.copyWith(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                    ),
                    AutoSizeText(
                      date[1],
                      maxLines: 1,
                      style: kTextSecondaryBig.copyWith(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: AutoSizeText(
                    day,
                    maxFontSize: 25,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kTextPrimiaryBig.copyWith(
                      color: Colors.black,
                    ),
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

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
