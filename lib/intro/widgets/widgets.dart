import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mess_food_app/utils/functions.dart';
import 'package:mess_food_app/utils/icons_svg.dart';
import 'package:mess_food_app/utils/text.dart';

class IntoPageWidget extends StatelessWidget {
  const IntoPageWidget({
    super.key,
    required this.value,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: SvgPicture.string(
              kSvgLogo,
              width: getWidth(context, 100 * value),
            ),
          ),
        ),
        Text(
          "version 1.0.0",
          style: kTextPrimiarySmall.copyWith(fontSize: 12),
        ),
        SizedBox(
          height: getHeight(context, 1),
        ),
      ],
    );
  }
}
