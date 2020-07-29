import 'package:flutter/material.dart';
import 'package:todoet/Screens/ChangeDetails_Screen.dart';
import 'package:todoet/Screens/Registration_Screen.dart';
import 'package:todoet/Screens/Settings_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
class password extends StatefulWidget {
  @override
  _passwordState createState() => _passwordState();
}

class _passwordState extends State<password> {


String password;
void _changePassword(String password) async{
   //Create an instance of the current user. 
    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    //Pass in the password to updatePassword.
    user.updatePassword(password).then((_){
      print('updated successfully');
      
    }).catchError((error){
      print("Password can't be changed" + error.toString());
      //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
    });
  }

  @override
  Widget build(BuildContext context) {
    
        return Container(
          color: Colors.white,
            child: Stack(children: <Widget>[
                Positioned(
                  top: -70,
                  left: -100,
                  child: Image.asset('images/Ellipse 1.png'),
                  
                  ),
                   Positioned(
                     top: 30,
                  left: 10,
                     child: Image.asset('images/home.png')),
             Scaffold(
               backgroundColor: Colors.yellow.withOpacity(0),
            body:  SingleChildScrollView(
                              child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  SizedBox(
                                   height: 150,
                                 ),
                                 Center(
                                   child: Container(
                                       child: Text(
                                         'DETAILS',
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
               
                  decoration: kTextFieldStyle.copyWith(
                               border: KOutLineBorder,
                               suffixIcon: Icon(Icons.lock),
                               hintText: ('Old password')
                  ),
                ),
              ),
              Padding(
                 padding: const EdgeInsets.only(left: 19, right: 18),
                child: TextField(
                onChanged: (value){
                  password = value;
                },
                  decoration: kTextFieldStyle.copyWith(
                  border: KOutLineBorder,
                   suffixIcon: Icon(Icons.lock),
                   hintText: ('New password')
                  ),),
              ),
        Padding(
          padding: const EdgeInsets.only(left: 19, right: 18),
          child: Buttons(onPressed: (){


_changePassword(password);


            
          }, buttonName:("Update")),
        )
          ],),
            ),),
        Positioned(
              bottom: -70,
              right: -100,
              child: Image.asset('images/Ellipse 1.png'),
              
              ), 

            
               ],)
      );
  }
}