import 'package:awesome_app/model/Weather.dart';
import 'package:awesome_app/services/services.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);
  static const String routeName = '/weather';

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    _getData();
    super.initState();
  }

  final TextEditingController controller = TextEditingController();
  WeatherData? weather;
  bool isLoading = false;

  final Color background = const Color(0xff35AAFD);

  String location = 'Theni';

  void _getData() async {
    setState(() {
      isLoading = true;
    });

    try {
      weather = await fetchData(location);
    } catch (e) {
      debugPrint(e.toString());
    }

    setState(() {
      isLoading = false;
    });
  }

  Widget twoTexts(String top, String bottom) {
    return Column(
      children: <Widget>[
        Text(
          top,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          bottom,
          style: const TextStyle(
            color: Colors.white60,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var alertDialog = AlertDialog(
      title: const Text("Change"),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(labelText: 'Place'),
      ),
      actions: [
        TextButton(
            onPressed: () {
              location = controller.value.text;
              _getData();
              Navigator.of(context).pop();
            },
            child: const Text("Okay")),
      ],
      elevation: 24,
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: background,
        bottomOpacity: 0,
        elevation: 0,
        title: Text(location),
        centerTitle: true,
      ),
      backgroundColor: background,
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: SizedBox(
                      height: 210,
                      child: Image.asset('assets/images/cloud.png'),
                    ),
                  ),
                  Text(
                    weather!.main.temp.round().toString() + '°',
                    style: const TextStyle(
                      fontSize: 150,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    weather!.weather[0].description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      twoTexts(weather!.main.tempMin.round().toString() + '°',
                          'Min'),
                      twoTexts(weather!.main.humidity.round().toString() + '°',
                          'Humidity'),
                      twoTexts(weather!.main.tempMax.round().toString() + '°',
                          'Max'),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.yellow),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context, builder: (context) => alertDialog);
                    },
                    child: const Text(
                      'Change',
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
