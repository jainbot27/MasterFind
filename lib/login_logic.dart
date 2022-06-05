import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:name/error_message.dart';


FirebaseAuth auth = FirebaseAuth.instance;

Future<bool> loginToFlutter(String username, String password, BuildContext context) async {
  try {
    await auth.signInWithEmailAndPassword(
      email: username, 
      password: password); 
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      createErrorMessage(context, 'Your account does not exist');
    } else if (e.code == 'wrong-password') {
      createErrorMessage(context, 'Wrong Password');
    } else {
      createErrorMessage(context, e.code);
    }
    return false;
  }
}