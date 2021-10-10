import 'package:awesome_app/screens/age_calculator.dart';
import 'package:awesome_app/screens/alerts.dart';
import 'package:awesome_app/screens/forms.dart';
import 'package:awesome_app/screens/home.dart';
import 'package:awesome_app/screens/image_icon.dart';
import 'package:awesome_app/screens/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'screens/stack_example.dart';
import './routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      home: const Home(),
      routes: {
        Routes.stack: (context) => StackScreen(),
        Routes.forms: (context) => Forms(),
        Routes.images: (context) => ImagesAndIcons(),
        Routes.alerts: (context) => AlertScreen(),
        Routes.tabs: (context) => TabbarScreen(),
        Routes.age: (context) => AgeCalculator(),
      },
    );
  }
}
