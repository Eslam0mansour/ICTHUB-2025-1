import 'package:first/screens/new_screen.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
            itemCount: myList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  tileColor: Colors.red,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NewScreen(
                          title: myList[index],
                        ),
                      ),
                    );
                  },
                  title: Text(myList[index]),
                  subtitle: Text('This is the subtitle'),
                  leading: Image.network(
                    'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
                  ),
                  trailing: Text('$index'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
