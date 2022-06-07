import 'package:flutter/material.dart';
import 'package:name/leaderboard.dart';
import 'package:name/error_message.dart';
import 'package:name/gameui.dart';
import 'package:name/game_logic.dart';

List<int> answer = [];

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<int> currentVals = [-1, -1, -1, -1];
  Widget build(BuildContext context) {
    // resetGame();
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
            child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Consumer<UIUpdates>(builder: (C, A, B) {
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: gett(),
                ),
                // }),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Center(
                      child: Row(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      gameUI(
                        pos: 0,
                        sett: (value) {
                          currentVals[0] = value!;
                        },
                      ),
                      gameUI(
                        pos: 1,
                        sett: (value) {
                          currentVals[1] = value!;
                        },
                      ),
                      gameUI(
                        pos: 2,
                        sett: (value) {
                          currentVals[2] = value!;
                        },
                      ),
                      gameUI(
                        pos: 3,
                        sett: (value) {
                          currentVals[3] = value!;
                        },
                      ),
                    ],
                  ))
                ]),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      bool err = false;
                      for (int i = 0; i < 4; i++) {
                        for (int j = i + 1; j < 4; j++) {
                          if (array[i] == array[j]) {
                            err = true;
                          }
                        }
                      }
                      if (err) {
                        createErrorMessage(context,
                            'Make sure your responses are of unique colors');
                        return;
                      }
                      addGuess(array, context);
                      setState(() {});
                    },
                    child: Text('Check your response'))
              ]),
        )),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
