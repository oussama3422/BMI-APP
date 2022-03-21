import 'package:flutter/material.dart';
import 'package:flutter_application_1/result.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        canvasColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 93,
        ),
        textTheme:const TextTheme(
          headline1: TextStyle(
            fontSize: 30,
            fontWeight:FontWeight.bold,
            color: Colors.white,
          ),
        ) ,
        primarySwatch: Colors.teal,
      ),
      home: const HomeScreen(),
    );
  }
}