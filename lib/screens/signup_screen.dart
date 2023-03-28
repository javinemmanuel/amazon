import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:amazon_project/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signup_screen extends StatefulWidget {
  const signup_screen({super.key});

  @override
  State<signup_screen> createState() => _signup_screenState();
}

class _signup_screenState extends State<signup_screen> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
              child: Column(children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter UserName',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                    controller: emailTextController,
                    decoration: InputDecoration(
                      labelText: 'Enter Email Id',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Form(
                        child: Column(
                      children: [
                        TextFormField(
                          controller: passwordTextController,
                          decoration: InputDecoration(
                            labelText: 'Enter PassWord',
                            prefixIcon: Icon(Icons.lock),
                          ),
                        ),
                      ],
                    )),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  MaterialButton(
                    onPressed: () {
                      prefs.then((value) => value.setBool("userstate", true));
                      print("email ${emailTextController.text}");
                      print("password ${passwordTextController.text}");
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emailTextController.text.toString(),
                              password: passwordTextController.text.toString())
                          .then((value) => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => home_screen()),
                                ),
                              });
                    },
                    child: Text('Submit'),
                    textColor: Colors.white,
                    color: Colors.teal,
                  ),
                ],
              )),
            ),
          ])),
        ),
      ),
    );
  }
}
