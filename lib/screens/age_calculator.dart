import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class AgeCalculator extends StatefulWidget {
  AgeCalculator({Key? key}) : super(key: key);

  static const String routeName = '/age';

  @override
  State<AgeCalculator> createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator> {
  final Color backgroundColor = Color(0xff121212);

  final Color bodyColor = Color(0xff1E1E1E);

  final Color buttonColor = Color(0xffBB86FC);

  DateTime now = DateTime.now();
  DateTime? choseDate;

  int? result;

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

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Container(
          height: totalHeight * .4,
          width: totalWidth * .4,
          decoration: BoxDecoration(
            color: bodyColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  "Age Calculator",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: OutlinedButton(
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(1950, 1, 1),
                              maxTime: DateTime.now(), onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            print('confirm $date');

                            setState(() {
                              choseDate = date;
                              result = daysBetween(date, now);
                            });
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.en);
                        },
                        child: Text(
                          'Choose Birth Date ' + choseDate.toString(),
                          style: TextStyle(color: Colors.blue),
                        )),
                  ),
                  Text('Today : ' + getDMY(DateTime.now()),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.blue)),
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
