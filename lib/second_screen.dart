import 'package:flutter/material.dart';

// - Container
// - Image (Network - assets) Image.asset()
// - Column & Row

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          // alignment: AlignmentDirectional.center, // align the child
          clipBehavior: Clip.antiAlias, // crop the image border radius
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomRight: Radius.circular(36),
            ),
            color: Colors.teal,
          ),
          width: 300,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Who Am I?",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Flutter Developer",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
              Row(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        16,
                      ),
                    ),
                    padding: EdgeInsets.all(
                      8,
                    ),
                    width: 100,
                    height: 100,
                    child: Image.network(
                      "https://cdn-icons-gif.flaticon.com/17905/17905521.gif",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
