import 'package:flutter/material.dart';
import 'package:name/main.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int codeSize = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MasterFind')
      ),
      body: GridView.count(
        crossAxisCount: codeSize + 1,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 500),
        children: List.generate(10 * (codeSize + 1), (index) {
          return Center(
            child: Text(
              'Item $index',
            ),
            // child: ElevatedButton(onPressed: () {Navigator.pop(context);},)
          );
        }),
      ),
    );
      
    
  }
}