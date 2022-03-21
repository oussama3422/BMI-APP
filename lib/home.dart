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
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  expandedMethod1(context, 'Male'),
                  const SizedBox(width: 13),
                  expandedMethod1(context, 'Female'),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  expandedMethod2(context, 'Weight'),
                  const SizedBox(width: 13),
                  expandedMethod2(context, 'Age'),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  // :::::::::::::::::::::Expanded Method 1:::::::::::::::::::::::::::::::::::::
  Expanded expandedMethod1(BuildContext context, String typeName) {
    return Expanded(
        child: GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: isMale && typeName == 'Male' || !isMale && typeName == 'Female'
              ? Colors.teal
              : Colors.blueGrey,
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

  // :::::::::::::::::::::Expanded Method 2:::::::::::::::::::::::::::::::::::::
  Expanded expandedMethod2(BuildContext context, String typeName) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: Colors.blueGrey,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            typeName == 'Age' ? 'Age' : 'Weight',
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 16),
          Text(
            typeName == 'Age' ? '$age' : '$weight',
            style: Theme.of(context).textTheme.headline2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag:
                    typeName == 'Age' ? 'decrease Age' : ' decrease Weight',
                onPressed: () {
                  setState(() {
                    typeName=='Age'? age--:weight--;
                  });
                },
                child: const Icon(Icons.remove,size: 30),
                mini: true,
              ),
              FloatingActionButton(
                heroTag: typeName == 'Age' ? 'Increase Age' : 'Increase Weight',
                onPressed: () {
                  setState(() {
                    typeName=='Age'? age++:weight++;
                  });
                },
                child: const Icon(Icons.add,size: 30,),
                mini: true,
              ),
              
            ],
          )
        ],
      ),
    ));
  }
}
