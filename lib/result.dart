import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {Key? key, required this.isMale, required this.result, required this.age})
      : super(key: key);

  final bool isMale;
  final double result;
  final int age;

  // static const routeName='result-page';

  String get returnresultString {
    String textresult = '';
    if (result >= 30)
      textresult = 'Obese';
     else if (result > 25 && result < 30) 
      textresult = 'OverWeight';
     else if (result >= 18.5 && result <= 24.9) 
      textresult = 'Normal';
     else 
      textresult = 'Thin';
    
    return textresult;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Result'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Gender : ${isMale ? "Male" : "Female"}',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  'Result : ${result.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  'Healthness : $returnresultString',
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Age : $age',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
          ),
        ));
  }
}
