import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Registration_Screen.dart';
import 'Task_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';

class Login_page extends StatefulWidget {
  @override
  _Login_pageState createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  final _auth = FirebaseAuth.instance;
  String Email;
  String Password;
  bool showSpinner = false;

  var loggedInUser;
  @override
  void initState()  {
    super.initState();

    getCurrentUser();
    
                    
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
          children: <Widget>[
             Positioned(
              bottom: -120,
              right: -90,
              child: Image.asset(
                'images/Ellipse 1.png',
                height: 250,
              ),
            ),
            Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xFFA84F44),
                centerTitle: true,
                title: Text('LOG IN'),
              ),
              backgroundColor: Colors.yellow.withOpacity(0),
                          body: SingleChildScrollView(
                child:
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                    
                      SizedBox(
                        height: 70,
                      ),
                      Center(
                        child: Container(
                          child: Text(
                            'WELCOME BACK',
                            style: TextStyle(
                                fontSize: 30,
                                color: Color(0xFF242235),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Dont have an account ?',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF242235),
                                    fontWeight: FontWeight.w500),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Resgistration_Screen()));
                                },
                                child: Text(
                                  'sign up',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFFA84F44),
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            Email = value;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: kTextFieldStyle.copyWith(
                            contentPadding: EdgeInsets.all(8.0),
                            hintText: 'example@gmail.com',
                            suffixIcon: Icon(
                              Icons.email,
                              color: Color(0xFFA84F44),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFA84F44),
                              ),
                            ),
                          ),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            Password = value;
                          },
                          decoration: kTextFieldStyle.copyWith(
                            contentPadding: EdgeInsets.all(8.0),
                            suffixIcon: Icon(
                              Icons.lock,
                              color: Color(0xFF616161),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFA84F44),
                              ),
                            ),
                            hintText: 'Password',
                          ),
                          obscureText: true,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 150, right: 15, top: 0, bottom: 0),
                        child: ButtonTheme(
                          height: 50,
                          child: RaisedButton(
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            color: Color(0xFF2F4858),
                            onPressed: () async {
                              setState(() {
                                showSpinner = true;
                              });
                              try {
                                final user =
                                    await _auth.signInWithEmailAndPassword(
                                        email: Email, password: Password);
                                if (user != null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Task_Screen()));
                                }

                                setState(() {
                                  showSpinner = false;
                                });
                              } catch (e) {
                                print(e);
                              }
                            },
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              side: BorderSide(color: Color(0xFF2F4858))),
                        ),
                      ),
                    ],
                  ),
              ),
            ),
           
          ],
        ),
      );
    
  }
}
