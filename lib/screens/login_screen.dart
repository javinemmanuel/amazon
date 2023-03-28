import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:amazon_project/screens/signup_screen.dart';
import 'package:amazon_project/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, home: login_screen()));
}

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => login_screenState();
}

class login_screenState extends State<login_screen> {
  TextEditingController emailTextControlller = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  // null=?
  // not null=!

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          // padding: const EdgeInsets.all(1),
          padding: const EdgeInsets.only(top: 100),
          // padding: EdgeInsets.fromLTRB(
          //     MediaQuery.of(context).size.width / 13,
          //     MediaQuery.of(context).size.height / 18,
          //     MediaQuery.of(context).size.width / 8,
          //     MediaQuery.of(context).size.height / 18),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Amazon',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Form(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailTextControlller,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: 'Enter email',
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 30),
                          Form(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: TextFormField(
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      controller: passwordTextController,
                                      decoration: InputDecoration(
                                        labelText: 'password',
                                        hintText: 'Enter password',
                                        prefixIcon: Icon(Icons.password),
                                        border: OutlineInputBorder(),
                                      ),
                                      onChanged: (String value) {}),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        30),
                                MaterialButton(
                                  onPressed: () async {
                                    prefs.then((value) =>
                                        value.setBool("userstate", true));
                                    FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: emailTextControlller.text
                                                .toString(),
                                            password: passwordTextController
                                                .text
                                                .toString())
                                        .then((value) => {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        home_screen()),
                                              ),
                                            });
                                  },
                                  child: Text('Login'),
                                  textColor: Colors.white,
                                  color: Colors.teal,
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        20),
                                Padding(
                                  padding: const EdgeInsets.all(55),
                                  child: Form(
                                      child: Row(
                                    children: [
                                      Text(
                                        "Don't Have An Account?",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                179, 19, 18, 18)),
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    signup_screen()),
                                          );
                                        },
                                        child: Text(
                                          'Sign up',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 11, 11, 11),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
