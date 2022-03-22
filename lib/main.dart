import 'package:flutter/material.dart';
import 'package:flutter_application_1/result.dart';
import 'home.dart';
import 'result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headline2: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.w800,
            color:Colors.white,
          ),
        ),
        primarySwatch: Colors.teal,
      ),
      home: const HomeScreen(),
    );
  }
}
