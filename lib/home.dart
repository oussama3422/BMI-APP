import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'result.dart';
import 'dart:math';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = false;
  double heightVal = 180;

  int weight = 70;
  int age = 33;

  @override
  Widget build(BuildContext context) {
    var isWindow = Platform.isWindows;
    var isFuchsia = Platform.isFuchsia;
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI (Body Mass Index)'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          isWindow
              ? Expanded(
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
                )
              : Expanded(
                  child: Padding(
                    padding: isLandscape
                        ? const EdgeInsets.all(0.0)
                        : const EdgeInsets.all(08.0),
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
            child: isLandscape && !isWindow
                ? Container(
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              'Height',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            const SizedBox(width: 100),
                            Text(
                              heightVal.toStringAsFixed(2),
                              style: Theme.of(context).textTheme.headline2,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'CM',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Slider(
                            value: heightVal,
                            onChanged: (newVal) {
                              setState(() {
                                heightVal = newVal;
                              });
                            },
                            min: 90,
                            max: 200,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    width: 900,
                    // height: 900,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Text(
                          'Height',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              heightVal.toStringAsFixed(2),
                              style: Theme.of(context).textTheme.headline2,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'CM',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ],
                        ),
                        Slider(
                          value: heightVal,
                          onChanged: (newVal) {
                            setState(() {
                              heightVal = newVal;
                            });
                          },
                          min: 90,
                          max: 200,
                        ),
                      ],
                    ),
                  ),
          ),
          isWindow 
              ? Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Container(
                         child:expandedMethod2(context, 'Weight'),
                      ),
                      const SizedBox(width: 12),
                     Container(
                       child:expandedMethod2(context, 'Age'),
                       ),
                    ],
                  ),
                )
              : Expanded(
                  child: Padding(
                    padding: isLandscape
                        ? const EdgeInsets.all(0.0)
                        : const EdgeInsets.all(0.0),
                    child: Row
                    (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: 
                      [
                        expandedMethod2(context, 'Weight'),
                        isLandscape? const SizedBox(width: 20) : const SizedBox(width: 0),
                        expandedMethod2(context, 'Age'),
                      ],
                    ),
                  ),
                ),
          Container(
            color: Colors.teal,
            width: double.infinity,
            height: isLandscape && !isWindow ? height/10 : height/15,
            child: TextButton
            (
                onPressed: () {
                  var result2 = weight/pow(heightVal/100,2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Result(
                        isMale: true,
                        result: result2,
                        age: 29,
                      ),
                    ),
                  );
                },
                child: Text('Calculate',
                    style: Theme.of(context).textTheme.headline1)
            ),
          ),
        ],
      ),
    );
  }

  // :::::::::::::::::::::Expanded Method 1:::::::::::::::::::::::::::::::::::::
  expandedMethod1(BuildContext context, String typeName) {
    var isWindow = Platform.isWindows;
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return isLandscape && !isWindow
        ? Expanded(
            child: GestureDetector(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: isMale && typeName == 'Male' ||
                            !isMale && typeName == 'Female'
                        ? Colors.teal
                        : Colors.blueGrey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        typeName == 'Male' ? Icons.male : Icons.female,
                        size: 40,
                      ),
                      Text(
                        typeName == 'Male' ? 'Male' : 'Female',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
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
            ),
          )
        : Expanded(
            child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: isMale && typeName == 'Male' ||
                        !isMale && typeName == 'Female'
                    ? Colors.teal
                    : Colors.blueGrey,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    typeName == 'Male' ? Icons.male : Icons.female,
                    size: 90,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
  expandedMethod2(BuildContext context, String typeName) {
    var isWindow = Platform.isWindows;
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return isLandscape && !isWindow
        ? Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Colors.blueGrey,
                ),
                child: Row(
                  children: [
                    Text(
                      typeName == 'Age' ? 'Age : ' : 'Weight : ',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      typeName == 'Age' ? '$age' : '$weight',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          heroTag: typeName == 'Age'
                              ? 'decrease Age'
                              : ' decrease Weight',
                          onPressed: () {
                            setState(() {
                              typeName == 'Age' ? age-- : weight--;
                            });
                          },
                          child: const Icon(Icons.remove, size: 30),
                          mini: true,
                        ),
                        FloatingActionButton(
                          heroTag: typeName == 'Age'
                              ? 'Increase Age'
                              : 'Increase Weight',
                          onPressed: () {
                            setState(() {
                              typeName == 'Age' ? age++ : weight++;
                            });
                          },
                          child: const Icon(
                            Icons.add,
                            size: 30,
                          ),
                          mini: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width:200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.blueGrey,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    typeName == 'Age' ? 'Age' : 'Weight',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Column(
                    children: [
                      Text(
                        typeName == 'Age' ? '$age' : '$weight',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        heroTag: typeName == 'Age'
                            ? 'decrease Age'
                            : ' decrease Weight',
                        onPressed: () {
                          setState(() {
                            typeName == 'Age' ? age-- : weight--;
                          });
                        },
                        child: const Icon(Icons.remove, size: 30),
                        mini: true,
                      ),
                      const SizedBox(width: 10),
                      FloatingActionButton(
                        heroTag: typeName == 'Age'
                            ? 'Increase Age'
                            : 'Increase Weight',
                        onPressed: () {
                          setState(() {
                            typeName == 'Age' ? age++ : weight++;
                          });
                        },
                        child: const Icon(
                          Icons.add,
                          size: 30,
                        ),
                        mini: true,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
