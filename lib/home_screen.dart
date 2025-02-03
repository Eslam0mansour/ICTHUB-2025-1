import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF862727),
        title: Text('ICT Flutter', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                counter--;
              });
            },
            icon: Icon(Icons.remove, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            icon: Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      body: Center(
        child: Text(
          counter.toString(),
          style: TextStyle(
            fontSize: 30.5,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
