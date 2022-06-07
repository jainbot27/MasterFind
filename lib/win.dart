import 'package:flutter/material.dart';
import 'package:name/main.dart';

class WinPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: const Image(image: AssetImage('lib/youwin.jpeg')),
          ),
          TextButton(child: Text('Return Home'), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'foo'))),)
        ],
      )
    );
  }
}