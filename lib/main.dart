import 'package:flutter/material.dart';
import 'package:mess_food_app/intro/screens/into.dart';
import 'package:mess_food_app/login_page/screens/login.dart';
import 'package:mess_food_app/menu_page/screen/menu_page.dart';
import 'package:mess_food_app/time_page/screens/time_page.dart';
import 'package:mess_food_app/utils/selection_provider.dart';
import 'package:mess_food_app/welcome_screen/screens/welcome.dart';
import 'package:mess_food_app/login_page/utils/state_managment.dart';

import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginPageData>(create: (_) => LoginPageData()),
        ChangeNotifierProvider<Selection>(create: (_) => Selection()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const IntoPage(),
        '/login': (context) => const LoginPage(),
        '/welcome': (context) => const WelcomePage(),
        '/time_page': (context) => const TimePage(),
        '/menu_page': (context) => const MenuPage(),
      },
    );
  }
}
