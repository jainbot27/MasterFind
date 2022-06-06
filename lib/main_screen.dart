import 'package:flutter/material.dart';
import 'package:name/leaderboard.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text('MasterFind versus the Computer'),
            actions: [
              IconButton(
                icon: const Icon(Icons.leaderboard_rounded),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Leaderboard()));
                },
              ),
            ]),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
