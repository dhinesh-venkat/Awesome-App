import 'package:awesome_app/routes/routes.dart';
import 'package:awesome_app/screens/age_calculator.dart';
import 'package:awesome_app/screens/alerts.dart';
import 'package:awesome_app/screens/bmi.dart';
import 'package:awesome_app/screens/forms.dart';
import 'package:awesome_app/screens/home.dart';
import 'package:awesome_app/screens/images_icons.dart';
import 'package:awesome_app/screens/stack_example.dart';
import 'package:awesome_app/screens/tab_bar.dart';
import 'package:awesome_app/screens/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            color: Color(0xffE1E1E1),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          headline2: TextStyle(
            color: Color(0xffE1E1E1),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
          bodyText1: TextStyle(
            color: Color(0xffE1E1E1),
            fontSize: 16,
          ),
        ),
      ),
      home: Home(),
      routes: {
        Routes.login: (context) => const StackScreen(),
        Routes.forms: (context) => FormScreen(),
        Routes.imagesicons: (context) => ImagesAndIcons(),
        Routes.alerts: (context) => AlertScreen(),
        Routes.tabBar: (context) => TabBarScreen(),
        Routes.age: (context) => AgeCalculator(),
        Routes.bmi: (context) => BMIScreen(),
        Routes.weather: (context) => WeatherScreen(),
      },
    );
  }
}
