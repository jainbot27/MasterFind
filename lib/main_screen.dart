import 'package:flutter/material.dart';
import 'package:name/leaderboard.dart';
import 'package:name/gameui.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<int> currentVals = [0, 0, 0, 0];
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
        body: Form(
          child: Column(
            children: [
              Row(
                children: [
                  gameUI(sett: (value) {
                    currentVals[0] = value!; 
                  },),
                  gameUI(sett: (value) {
                    currentVals[1] = value!; 
                  },),
                  gameUI(sett: (value) {
                    currentVals[2] = value!; 
                  },),
                  gameUI(sett: (value) {
                    currentVals[3] = value!; 
                  },),
                ],
              )
            ]
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
