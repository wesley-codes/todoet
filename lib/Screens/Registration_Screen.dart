import 'package:todoet/Screens/Login_Screen.dart';
import 'package:todoet/Screens/Task_Screen.dart';
import 'Task_Screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class Resgistration_Screen extends StatefulWidget {
  @override
  _Resgistration_ScreenState createState() => _Resgistration_ScreenState();
}

class _Resgistration_ScreenState extends State<Resgistration_Screen> {


  final _auth = FirebaseAuth.instance;
    Firestore _firestore = Firestore.instance;

  String FirstName;
  String LastName;
  String Password;
  String Email;
  bool showSpinner = false;
  TextEditingController usernamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:Stack(
       children: <Widget>[
           Positioned(
            bottom: -120,
            right: -120,
            child: Image.asset(
              'images/Ellipse 1.png',
              height: 250,
            ),
          ), 
          Scaffold(
            appBar: AppBar(
              title:Text('Sign Up'),
              centerTitle: true,
              backgroundColor: Color(0xFFA84F44)
            ),
            backgroundColor: Colors.yellow.withOpacity(0),
                      body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  
                 
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Container(
                      child: Text(
                        'CREATE ACCOUNT',
                        style: TextStyle(
                            fontSize: 30,
                            color: Color(0xFF242235),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Already have an account ?',
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
                                      builder: (context) => Login_page()));
                            },
                            child: Text(
                              'sign in',
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
                    height: 40,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15),
                      child: TextField(
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          FirstName = value;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: kTextFieldStyle.copyWith(
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: 'First Name',
                          suffixIcon: Icon(
                            Icons.account_circle,
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
                      )),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, left: 15),
                    child: TextField(
                      onChanged: (value) {
                        LastName = value;
                      },
                      textAlign: TextAlign.center,
                      decoration: kTextFieldStyle.copyWith(
                        contentPadding: EdgeInsets.all(8.0),
                        hintText: 'Last Name',
                        suffixIcon: Icon(
                          Icons.account_circle,
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
                  Padding(
                    padding: const EdgeInsets.only(right: 15, left: 15),
                    child: TextField(
                      onChanged: (value) {
                        Email = value;
                      },
                      textAlign: TextAlign.center,
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
                  Padding(
                    padding: const EdgeInsets.only(right: 15, left: 15),
                    child: TextField(
                      onChanged: (value) {
                        Password = value;
                      },
                      textAlign: TextAlign.center,
                      obscureText: true,
                      decoration: kTextFieldStyle.copyWith(
                        contentPadding: EdgeInsets.all(8.0),
                        hintText: 'Password',
                        suffixIcon: Icon(
                          Icons.lock,
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
                    height: 3,
                  ),
                  
                  Padding(
                    padding: EdgeInsets.only(
                        left: 150, right: 15, top: 0, bottom: 0),
                    child: ButtonTheme(
                      height: 50,
                      child: RaisedButton(
                        color: Color(0xFF2F4858),
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                       

                         onPressed: () async {
                           setState(() {
                             showSpinner = true;
                           });
                           try {
                             final newUser =
                                 await _auth.createUserWithEmailAndPassword(
                                     email: Email, password: Password);
                             var firebaseUser = await _auth.currentUser();
                              _firestore .collection("users")
                              .document(firebaseUser.uid)
                              .setData({'username':  LastName});

                             if (newUser != null) {
                               Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                       builder: (context) =>Task_Screen()));
                             }
                             setState(() {
                               showSpinner = false;
                             });
                           } catch (e) {
                             print(e);
                           }

                           print(Email);
                           print(Password);
                         },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
   ],
      )
    );
  }
}

const kTextFieldStyle = InputDecoration(
    hintText: (''), hintStyle: TextStyle(color: Colors.grey), errorText: ",");
