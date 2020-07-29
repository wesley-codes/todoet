import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Registration_Screen.dart';

import 'Login_Screen.dart';

class homeScreen extends StatefulWidget {
  @override
  _homeScreen createState() => _homeScreen();
}

class _homeScreen extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -80,
            left: -120,
            child: Image.asset('images/Ellipse 1.png'),
          ),
          ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 150,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: 200,
                          child: Center(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "TODO",
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Color(0xFF616161),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'PlayfairDisplay'),
                                ),
                                Text(
                                  "ET",
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Color(0xFFB23E47),
                                      fontFamily: 'NovaRound'),
                                ),
                                Icon(
                                  Icons.assignment,
                                  size: 35,
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Buttons(
                      title: 'Log in',
                      textcolor: Color(0xFF2F4858),
                      bodycolor: Colors.white,
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login_page()));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Buttons(
                        title: 'Sign Up',
                        textcolor: Colors.white,
                        bodycolor: Color(0xFF2F4858),
                        function: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Resgistration_Screen()));
                        }),
                  ),
                ],
              ),
            ],
          ),
         
        Positioned(
            bottom: -125,
            right: -125,
            child: Image.asset('images/Ellipse 1.png'),
          ) ],
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  Buttons(
      {this.bodycolor,
      this.title,
      this.function,
      this.loginradius,
      this.colors,
      this.textcolor});
  final String title;
  final Color bodycolor;
  final Function function;
  final Color colors;
  final Color textcolor;
  final BorderRadius loginradius;
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 50,
      child: RaisedButton(
        onPressed: function,
        color: bodycolor,
        child: Text(
          title,
          style: TextStyle(color: textcolor, fontSize: 20.0),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Color(0xFF2F4858))),
      ),
    );
  }
}
