import 'package:awesome_app/routes/routes.dart';
import 'package:awesome_app/screens/alerts.dart';
import 'package:awesome_app/screens/forms.dart';
import 'package:awesome_app/screens/home.dart';
import 'package:awesome_app/screens/images_icons.dart';
import 'package:awesome_app/screens/stack_example.dart';
import 'package:awesome_app/screens/tab_bar.dart';
import 'package:flutter/material.dart';

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
      ),
      home: Home(),
      routes: {
        Routes.login: (context) => const StackScreen(),
        Routes.forms: (context) => FormScreen(),
        Routes.imagesicons: (context) => ImagesAndIcons(),
        Routes.alerts: (context) => AlertScreen(),
        Routes.tabBar: (context) => TabBarScreen(),
      },
    );
  }
}
