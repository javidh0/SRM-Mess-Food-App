import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mess_food_app/utils/colors.dart';
import 'package:mess_food_app/utils/functions.dart';
import 'package:mess_food_app/utils/icons_svg.dart';
import 'package:mess_food_app/utils/text.dart';
import 'package:provider/provider.dart';

import '../utils/state_managment.dart';

class LoginPageWidget extends StatelessWidget {
  const LoginPageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: getWidth(context, 80),
        height: getHeight(context, 99.9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            context.watch<LoginPageData>().active
                ? Expanded(
                    flex: 5,
                    child: Center(
                      child: SvgPicture.string(
                        kSvgLogo,
                        height: getHeight(context, 30),
                      ),
                    ),
                  )
                : SizedBox(
                    height: getHeight(context, 10),
                  ),
            const Expanded(
              flex: 7,
              child: LoginWidgetHeader(),
            ),
            if (context.watch<LoginPageData>().active)
              const Expanded(
                flex: 3,
                child: LoginWidgetFooter(),
              ),
          ],
        ),
      ),
    );
  }
}

class LogInWidget extends StatelessWidget {
  const LogInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const LoginWidgetHeader(),
        context.watch<LoginPageData>().active
            ? const LoginWidgetFooter()
            : const SizedBox(),
      ],
    );
  }
}

class LoginWidgetHeader extends StatelessWidget {
  const LoginWidgetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Log-in",
          style: kTextPrimiaryBig,
        ),
        MyTextEntry(
          name: "Email-id",
          onChanged: (String value) {
            context.read<LoginPageData>().onChangeEmail(value);
          },
        ),
        MyTextEntry(
          name: "password",
          obscure: true,
          onChanged: (String value) {
            context.read<LoginPageData>().onChangePass(value);
          },
        ),
        const MySubmitButton(name: "Log-in"),
      ],
    );
  }
}

class LoginWidgetFooter extends StatelessWidget {
  const LoginWidgetFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AutoSizeText(
          'Or',
          style: kTextPrimiarySmall,
        ),
        AutoSizeText(
          'Log-in using',
          style: kTextPrimiarySmall,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: kWidgetGoogle,
          ),
        ),
        SizedBox(
          height: getHeight(context, 2),
        ),
      ],
    );
  }
}

class MyTextEntry extends StatelessWidget {
  const MyTextEntry({
    super.key,
    required this.name,
    required this.onChanged,
    this.placeholder = "",
    this.obscure = false,
  });

  final String name;
  final String placeholder;
  final bool obscure;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: kTextPrimiarySmall,
          ),
          ObscuredTextField(
            onChanged: onChanged,
            obscure: obscure,
          )
        ],
      ),
    );
  }
}

class ObscuredTextField extends StatelessWidget {
  const ObscuredTextField({
    super.key,
    required this.onChanged,
    this.placeholder = '',
    this.obscure = false,
  });

  final String placeholder;
  final bool obscure;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      width: getWidth(context, 100),
      child: TextField(
        onChanged: onChanged,
        onTap: () {
          context.read<LoginPageData>().changeActive(false);
        },
        onTapOutside: (event) {
          context.read<LoginPageData>().changeActive(true);
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        obscureText: obscure,
        onEditingComplete: () {
          context.read<LoginPageData>().changeActive(true);
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        decoration: InputDecoration(
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: placeholder,
        ),
      ),
    );
  }
}

class MySubmitButton extends StatelessWidget {
  const MySubmitButton({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/welcome');
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            width: getWidth(context, 30),
            height: 50,
            decoration: BoxDecoration(
              color: kColorBackground,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                name,
                style: kTextSecondaryBig,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
