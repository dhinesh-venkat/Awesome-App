import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AgeCalculator extends StatefulWidget {
  const AgeCalculator({Key? key}) : super(key: key);
  static const String routeName = '/age';

  @override
  _AgeCalculatorState createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator> {
  // color properties
  final Color backgroundColor = Color(0xff121212);

  final Color bodyColor = Color(0xff1E1E1E);

  final Color buttonColor = Color(0xffBB86FC);

  // date properties
  DateTime now = DateTime.now();
  DateTime? choseDate;

  int? result;

  // flutter pub get
  String getDMY(DateTime date) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(date);
    return formatted;
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inMilliseconds / (1000 * 60 * 60 * 24 * 365))
        .round();
  }

  @override
  Widget build(BuildContext context) {
    final double totalWidth = MediaQuery.of(context).size.width;
    final double totalHeight = MediaQuery.of(context).size.height;

    final TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Container(
          height: .4 * totalHeight,
          width: .4 * totalWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: bodyColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Age Calculator',
                  style: theme.headline1,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  OutlinedButton(
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            locale: LocaleType.en,
                            minTime: DateTime(1950, 1, 1),
                            maxTime: DateTime.now(),
                            currentTime: DateTime.now(), onConfirm: (date) {
                          setState(() {
                            result = daysBetween(date, now);
                          });
                        });
                      },
                      child: const Text(
                        'Choose Birth Date',
                      )),
                  Text(
                    'Today ' + getDMY(now),
                    style: theme.bodyText1!.copyWith(color: Colors.blue),
                  )
                ],
              ),
              Text(
                result != null ? result.toString() : '',
                style: const TextStyle(
                  color: Color(0xffbb86fc),
                  fontSize: 100,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
