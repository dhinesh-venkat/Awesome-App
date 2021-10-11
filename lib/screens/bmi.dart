import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);
  static const String routeName = '/bmi';

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final _heightController = TextEditingController();

  final _weightController = TextEditingController();

  double? _bmi;

  String _message = 'Please enter your height an weight';

  void _calculate() {
    final double? height = double.tryParse(_heightController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);

    if (height == null || height <= 0 || weight == null || weight <= 0) {
      setState(() {
        _message = "Your height and weight must be positive numbers";
      });
      return;
    }

    setState(() {
      _bmi = weight / (height * height);
      if (_bmi! < 18.5) {
        _message = "You are underweight";
      } else if (_bmi! < 25) {
        _message = 'You body is fine';
      } else if (_bmi! < 30) {
        _message = 'You are overweight';
      } else {
        _message = 'You are obese';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.of(context).size.width;
    final totalHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        elevation: 0,
        bottomOpacity: 0,
        backgroundColor: Colors.deepOrange,
      ),
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: SizedBox(
          width: .4 * totalHeight,
          height: .8 * totalWidth,
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: _heightController,
                    decoration:
                        const InputDecoration(labelText: 'Height in (m)'),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: _weightController,
                    decoration:
                        const InputDecoration(labelText: 'Weight in (kg)'),
                  ),
                  ElevatedButton(
                    onPressed: _calculate,
                    child: const Text('Calculate'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    _bmi == null ? 'No Result' : _bmi!.toStringAsFixed(2),
                    style: const TextStyle(fontSize: 50),
                    textAlign: TextAlign.center,
                  ),
                  Text(_message, textAlign: TextAlign.center)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
