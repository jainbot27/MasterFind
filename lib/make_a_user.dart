import 'package:flutter/material.dart';
import 'package:name/new_user_logic.dart';

class MakeUser extends StatelessWidget {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController(); 
  TextEditingController passwordConfirmController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Need a new account?'),
        ),
        body: ListView(
          children: <Widget>[
            const Padding(padding: EdgeInsets.fromLTRB(0, 200, 0, 0)),
            Center(
              child: SizedBox(
                width: 400,
                child: TextField(
                  autocorrect: false,
                  enableSuggestions: false,
                  controller: usernameController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
            Center(
              child: SizedBox(
                width: 400,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
            Center(
              child: SizedBox(
                width: 400,
                child: TextField(
                  controller: passwordConfirmController,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    hintText: 'Confirm Password',
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
            Container(
                padding: const EdgeInsets.fromLTRB(520, 0, 520, 0),
                child: ElevatedButton(
                  child: const Text('Make Your New Account!'),
                  onPressed: () {
                    makeNewUser(usernameController.text, passwordController.text, passwordConfirmController.text, context);
                    usernameController.clear();
                    passwordController.clear(); 
                    passwordConfirmController.clear(); 
                  },
                )),
          ],
        ));
  }
}
