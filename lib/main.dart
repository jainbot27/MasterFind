import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:name/login_logic.dart';
import 'package:name/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MasterFind',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MasterFind'),
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
            Container(
                padding: const EdgeInsets.fromLTRB(520, 0, 520, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    loginToFlutter(usernameController.text,
                        passwordController.text, context);
                  },
                ))
          ],
        ));
  }
}
