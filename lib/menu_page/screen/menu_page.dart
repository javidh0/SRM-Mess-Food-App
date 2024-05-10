import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mess_food_app/menu_page/screen/loading_screen.dart';
import 'package:mess_food_app/menu_page/utils/functions.dart';
import 'package:mess_food_app/utils/colors.dart';
import 'package:mess_food_app/utils/data.dart';
import 'package:mess_food_app/utils/functions.dart';
import 'package:mess_food_app/utils/selection_provider.dart';
import 'package:mess_food_app/utils/text.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    await data.load();
    setState(() {
      loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading ? const LoadedScreen() : const ExampleUiLoadingAnimation();
  }
}

class LoadedScreen extends StatelessWidget {
  const LoadedScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: MenuPageAppBar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: getMenuCards(data.getSelectedMenu(context)),
          ),
        ),
      ),
    );
  }
}

class MenuPageAppBar extends StatelessWidget {
  const MenuPageAppBar({super.key});

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
        child: Center(
          child: AutoSizeText(
            name[context.watch<Selection>().selectedTime - 1],
            maxLines: 1,
            maxFontSize: 27,
            style: kTextPrimiaryBig.copyWith(),
          ),
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getWidth(context, 90),
          child: const Divider(
            thickness: 0.75,
            color: Colors.black,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: getWidth(context, 10),
            ),
            SizedBox(
              child: Container(
                color: Colors.grey,
                height: 60,
                width: 60,
                child: Center(
                  child: AutoSizeText(
                    name[0],
                    maxFontSize: 25,
                    maxLines: 1,
                    style: kTextPrimiaryBig.copyWith(),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: getWidth(context, 10),
            ),
            SizedBox(
              width: getWidth(context, 50),
              child: AutoSizeText(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: kTextSecondaryBig.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: getWidth(context, 10),
            ),
          ],
        ),
      ],
    );
  }
}
