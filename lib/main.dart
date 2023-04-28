import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taboo/pages/game_page.dart';
import 'package:taboo/pages/home_page.dart';
import 'package:taboo/theme/theme_constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.deepPurple.shade100,
      systemNavigationBarColor: Colors.deepPurple.shade100,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taboo',
      theme: appTheme,
      routes: {
        "/": (ctx) => const HomePage(),
        GamePage.routeName: (context) => GamePage(),
      },
    );
  }
}
