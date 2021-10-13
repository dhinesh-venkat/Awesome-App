import 'package:awesome_app/screens/age_calculator.dart';
import 'package:awesome_app/screens/alerts.dart';
import 'package:awesome_app/screens/bmi.dart';
import 'package:awesome_app/screens/forms.dart';
import 'package:awesome_app/screens/image_icon.dart';
import 'package:awesome_app/screens/journals.dart';
import 'package:awesome_app/screens/stack_example.dart';
import 'package:awesome_app/screens/tabs.dart';
import 'package:awesome_app/screens/weather_screen.dart';

class Routes {
  static const String stack = StackScreen.routeName;
  static const String forms = Forms.routeName;
  static const String images = ImagesAndIcons.routeName;
  static const String alerts = AlertScreen.routeName;
  static const String tabs = TabbarScreen.routeName;
  static const String age = AgeCalculator.routeName;
  static const String bmi = BMIScreen.routeName;
  static const String weather = WeatherScreen.routeName;
  static const String journals = JournalScreen.routeName;
}
