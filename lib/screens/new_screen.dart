import 'package:first/widgets/new_widget.dart';
import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Go back',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            NewWidget(
              title: 'New Widget 1',
              color: Colors.red,
            ),
            NewWidget(
              title: 'New Widget 2',
              color: Colors.blue,
              onTap: () {
                print('New Widget 2 tapped');
              },
            ),
            NewWidget(
              title: 'New Widget 3',
              color: Colors.green,
            ),
            NewWidget(
              title: 'New Widget 4',
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
