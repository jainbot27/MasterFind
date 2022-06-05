import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:name/error_message.dart';

void makeNewUser(String email, String password, String confirmPassword, BuildContext context) async {
  if (password != confirmPassword) {
    createErrorMessage(context, 'Your passwords are not the same'); 
    return;
  }
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    Navigator.of(context).pop();
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      createErrorMessage(context, 'The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      createErrorMessage(context, 'The account already exists for that email.');
    } else {
      createErrorMessage(context, e.code);
    }
  }
}