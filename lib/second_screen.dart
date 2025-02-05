import 'package:flutter/material.dart';

// - Container
// - Image (Network - assets) Image.asset()
// - Column & Row

class SecondScreen extends StatelessWidget {
  SecondScreen({super.key});

  final List<String> myList = [
    'eslam',
    'ahmed',
    'mohamed 1',
    'ali 1',
    'mohamed 2',
    'ali 2',
    'mohamed 3',
    'ali 3',
    'mohamed 4',
    'ali 4',
    'mohamed 5',
    'ali 5',
    'mohamed 6',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 400,
          child: ListView.builder(
            itemCount: myList.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(
                myList[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
