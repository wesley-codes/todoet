import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoet/Screens/Password_Screen.dart';
import 'Registration_Screen.dart';


class changeDetails extends StatefulWidget {
  @override
  _changeDetailsState createState() => _changeDetailsState();
}

class _changeDetailsState extends State<changeDetails> {

String firstName;
String lastName ;
String email;

 final _auth = FirebaseAuth.instance;
    Firestore _firestore = Firestore.instance;



void updateData(lastName) async{
  var firebaseUser = await _auth.currentUser();
  _firestore.collection('users').document(firebaseUser.uid).updateData({
    'lastName':lastName
  }).catchError((e){print(e);});
}

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
        child: Stack(
          children: <Widget>[
              Positioned(
              top: -70,
              left: -100,
              child: Image.asset('images/Ellipse 1.png'),
              
              ),
              
               Positioned(
                 top: 30,
              left: 10,
                 child: Image.asset('images/home.png'),),
            Scaffold(
              backgroundColor: Colors.yellow.withOpacity(0),
                          body:SingleChildScrollView(
                            child: Column(
               
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                   SizedBox(
                        height: 150,
                      ),
                      Center(
                        child: Container(
                          child: Text(
                            'SETTINGS',
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
                  Padding(
                    padding: const EdgeInsets.only(left: 19, right: 18),
                    child: TextField(
                      onChanged: (value){
                        firstName = value;
                      },
                      decoration: kTextFieldStyle.copyWith(
                        border:KOutLineBorder,
                        hintText: "First Name",
                                  suffixIcon:  Icon(Icons.account_circle)
                      ),
                      
                    ),
                  ),
                  Padding(
                   padding: const EdgeInsets.only(left: 19, right: 18),
                    child: TextField(
                      onChanged: (value){
                        lastName = value;
                      },
                        decoration: kTextFieldStyle.copyWith(
                        border:KOutLineBorder,
                             hintText: "Last Name",
                             suffixIcon:  Icon(Icons.account_circle)
                      ),),
                  ),
                  Padding(
                   padding: const EdgeInsets.only(left: 19, right: 18),
                    child: TextField( 
                      onChanged: (value){
                        email = value;
                      },
                       decoration: kTextFieldStyle.copyWith(
                        border:KOutLineBorder,
                             hintText: "example@gmail.com",
                             suffixIcon: Icon(Icons.email)
                         
                     
                      ),),
                  ),
                  SizedBox(
                    height: 30
                  ),
                 
                ],
              )
                          )
            ),
       
       Positioned(
              bottom: -70,
              right: -100,
              child: Image.asset('images/Ellipse 1.png'),
              
              ), 
               Positioned(
                 bottom: 105,
                 right: 50,
                                child: ButtonTheme(
                    height: 50,
                    minWidth:300 ,
                                    child: FlatButton(
                      onPressed:  () {
updateData(lastName);                      

                      }, 
                      child: Text('Update',style:TextStyle(
                        fontSize:20
                      )),
                      color: Colors.white,
                      shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: Color(0xFF2F4858))),
                      ),
                  ),
               )
               ],)
              
      );
  }
}


const KOutLineBorder =   OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFA84F44),
                          ),
                        );