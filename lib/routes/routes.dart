import 'package:awesome_app/screens/age_calculator.dart';
import 'package:awesome_app/screens/alerts.dart';
import 'package:awesome_app/screens/bmi.dart';
import 'package:awesome_app/screens/forms.dart';
import 'package:awesome_app/screens/images_icons.dart';
import 'package:awesome_app/screens/stack_example.dart';
import 'package:awesome_app/screens/tab_bar.dart';
import 'package:awesome_app/screens/weather_screen.dart';

class Routes {
  static const String login = StackScreen.routeName;
  static const String forms = FormScreen.routeName;
  static const String imagesicons = ImagesAndIcons.routeName;
  static const String alerts = AlertScreen.routeName;
  static const String tabBar = TabBarScreen.routeName;
  static const String age = AgeCalculator.routeName;
  static const String bmi = BMIScreen.routeName;
  static const String weather = WeatherScreen.routeName;
}
