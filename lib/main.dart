import 'package:amazon_project/screens/home_screen.dart';
import 'package:amazon_project/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(login());
}

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => loginState();
}

class loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'homeScreen',
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<SharedPreferences>(
          future: SharedPreferences.getInstance(),
          builder: (BuildContext context,
              AsyncSnapshot<SharedPreferences> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.containsKey("userstate")) {
                if (snapshot.data!.getBool("userstate")!) {
                  return home_screen();
                } else {
                  return login_screen();
                }
              } else {
                return login_screen();
              }
            }
            return Container(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
