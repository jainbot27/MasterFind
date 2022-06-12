import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:name/gameui.dart';
import 'package:name/lose.dart';
import 'package:name/main.dart';
import 'package:name/win.dart';
import 'package:name/main_screen.dart';
import 'package:name/leaderboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/*
  ATHARB JAIN.
  _checkGuess takes in the guess and returns an array of size 2 with the matches and perms (# of greens, # of yellows)
  */

// class UIUpdates {
  List<Widget> _guessList = [];
  int amtGuesses = 0;
  List<Widget> gett() {
    return _guessList;
  }

  void resetGame() {
    answer.clear();
    _guessList.clear();
    for (int i = 0; i < 6; i++) answer.add(i);
    for (int i = 0; i < 4; i++) {
      array[i] = 0; 
    }
    answer.shuffle();
    answer.removeAt(5);
    answer.removeAt(4);
    amtGuesses = 0;
  }

  List<int> _checkGuess(List<int> guess) {
    int allMat = 0;
    int permutationAmt = 0;

    /*
    ATHARB JAIN.
    Checks for number of matches and number of perms (greens and yellows)
    Change the guess[i] to your guess array and _answer[j] to the answer array
    */

    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        if (guess[i] == answer[j]) {
          if (i == j) {
            allMat++;
          } else {
            permutationAmt++;
          }
        }
      }
    }
    return [allMat, permutationAmt];
  }

  /*
  ATHARB JAIN.
  addGuess is the larger method run everytime the check button underneath the UI is pressed.
  it first runs the _checkGuess method.
  then it uses that returned array to check if all matches are correct or print out the number of matches and perms if the user has not yet won.
  change the code to print the colors guessed instead of the number sequence. (guess.toString() is the number sequence printed)
  */

  void addGuess(List<int> guess, BuildContext context) async {
    List<int> answer = _checkGuess(guess);
    String retMsg = '';
    amtGuesses++;
    if (answer[0] != 4) {
      retMsg = "# in right spot: " +
          answer[0].toString() +
          "; # of correct color but wrong spot: " +
          answer[1].toString();
      print(retMsg);
      if (amtGuesses == 10) {
        int curWins = -1, curLosses = -1; 
        await leadInfo.get().then((QuerySnapshot querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            // assert(doc.data().toString().contains('wins'));
            var email = doc['email'];
            var wins = doc['wins'];
            var losses = doc['losses'];
            if (email == globalEmail) {
              curWins = wins;
              curLosses = losses;
            }
          });
        });
        leadInfo.doc(globalEmail).set({
          'email': globalEmail,
          'wins': curWins,
          'losses': curLosses + 1
        });
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LossPage()));
      }
    } else {

        int curWins = -1, curLosses = -1; 
        await leadInfo.get().then((QuerySnapshot querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            // assert(doc.data().toString().contains('wins'));
            var email = doc['email'];
            var wins = doc['wins'];
            var losses = doc['losses'];
            if (email == globalEmail) {
              curWins = wins;
              curLosses = losses;
            }
          });
        });
        leadInfo.doc(globalEmail).set({
          'email': globalEmail,
          'wins': curWins + 1,
          'losses': curLosses
        });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WinPage()));
    }
    List<String> foo = [];
    for (int i = 0; i < 4; i++)   {
      foo.add(prList[guess[i]]);
    }

    _guessList.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text(foo.toString() + " " + retMsg)],
    ));
    // notifyListeners();
  }
// }
