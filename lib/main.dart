import 'package:first/text_field_tutorial.dart';
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
      home: TextFieldTutorialView(),
    );
  }
}
