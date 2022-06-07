import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:name/login_logic.dart';
import 'package:name/firebase_options.dart';
import 'package:name/make_a_user.dart';
import 'package:name/main_screen.dart';
import 'package:name/game_logic.dart';

String globalEmail = '';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // getNames();
  for (int i = 0; i < 6; i++) 
    answer.add(i); 
  answer.shuffle();
  // print(answer);
  answer.removeAt(5);
  answer.removeAt(4);

  runApp(
  // MultiProvider(
  //   // providers: [
  //   //   ChangeNotifierProvider(create: (context) => MainScreen()),
  //   // ],
  //   child: MyApp(),
  // ));
  MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MasterFind',
      debugShowCheckedModeBanner: false,
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
                padding: const EdgeInsets.fromLTRB(750, 0, 750, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () async {
                    bool okay = await loginToFlutter(usernameController.text,
                        passwordController.text, context);
                    globalEmail = usernameController.text; 
                    usernameController.clear();
                    passwordController.clear();
                    if (okay) {
                      // print("DEBUG");
                      resetGame();
                      print(answer);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainScreen()));
                    }
                  },
                )),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MakeUser()),
                );
              },
              child: const Text('New User'),
            ),
          ],
        ));
  }
}
