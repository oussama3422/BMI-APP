import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = false;
  double heightVal = 160;

  int weight = 55;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI (Body Mass Index)'),
        centerTitle: true,
      ),
      body: Center(
        child: SafeArea(
            child: Row(
          children: [
            expandedMethod(context, 'Male'),
            const SizedBox(width: 13),
            expandedMethod(context, 'Female'),
          ],
        )),
      ),
    );
  }

  Expanded expandedMethod(BuildContext context, String typeName) {
    return Expanded(
        child: GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: isMale ? Colors.teal : Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(typeName == 'Male' ? Icons.male : Icons.female),
            const SizedBox(height: 20),
            Text(
              typeName == 'Male' ? 'Male' : 'Female',
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          isMale = true;
          isMale = typeName == 'Male' ? true : false;
          
          // typeName == 'Male' ?isMale==true : isMale=false;
          // typeName == 'Male' ?isMale==true : false;
        });
      },
    ));
  }
}
