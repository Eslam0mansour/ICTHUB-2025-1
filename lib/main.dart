import 'package:first/home_screen.dart';
import 'package:first/second_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(IctApp());
}

class IctApp extends StatelessWidget {
  const IctApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SecondScreen(),
    );
  }
}
