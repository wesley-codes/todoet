

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoet/Models/task_data.dart';
import 'package:todoet/Widgets/Task_List.dart';
import 'package:todoet/Widgets/Add_Task.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoet/Screens/Registration_Screen.dart';
import 'Settings_Screen.dart';
import 'home_Screen.dart';

class Task_Screen extends StatefulWidget {

final String  email;
Task_Screen({this.email});
  @override
  _Task_ScreenState createState() => _Task_ScreenState();
}

class _Task_ScreenState extends State<Task_Screen> {
  String value;

  final _auth = FirebaseAuth.instance;
  
    Firestore _firestore = Firestore.instance;


  FirebaseUser loggedInUser;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        await Firestore.instance.collection('users').document(loggedInUser.uid).get().then((snapshot) {
          value = snapshot.data['username'];
          setState(() { 
                  value = snapshot.data['username'];
              
               
          });
        });
      }
    } catch (e) {
      print(e);
    }
   
    
  }
  

  @override
  void initState() {
    super.initState();
    getCurrentUser();
 
  
   
    
  }

  void readData() async{
      final user = await _auth.currentUser();
 _firestore.collection('users').document(user.uid).get().then((snapshot) {

   setState(() {
    value = snapshot.data['lastName'];
     print(value);
   });
 });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top:10),
        
        child: Container(
          color: Colors.yellow.withOpacity(0),
          child: Stack(
            children: <Widget>[
            
              Positioned(
                top: -80,
                left: -120,
                child: Image.asset('images/Ellipse 1.png'),
                
              ),
               Positioned(
                 top: 30,
              left: 10,
                 child: GestureDetector(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder:(context) => Settings() ));
                   },
                   child: Image.asset('images/settings.png'))),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                   
                      
                    ),
                    SizedBox(
                      height: 70
                    ),
                    Text('Tasks',style: TextStyle(
                      fontSize:30
                    ),),
                    SizedBox(
                      height: 25
                    ),
                    Expanded(
                        child: Container(
                      child: TaskList(),
                    )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Row(
                        
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              buildShowModalBottomSheet(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left:20.0),
                              child: Container(
                                height: 50,
                                width: 250,
                                child: Center(
                                    child: Text(
                                  "Enter task...",
                                  style: TextStyle(fontSize: 20),
                                )),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)),
                              ),
                            ),
                          ),
                          ButtonTheme(
                            height: 50,
                            child: RaisedButton(
                              onPressed: () {
                                buildShowModalBottomSheet(context);
                              },
                              child: Text(
                                "Add",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Color(0xFF2F4858),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            

              
            Positioned(
              right: 40,
              
                        child: Row(
                
                          
                          children: <Widget>[
                      
                            
                            Text(
                          "${value}",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        CircleAvatar(
                    radius: 40.0
                  )],
                        ),
            ),  ],
          ),
        ),
      ),
    );
  }

  Future buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(

        child: Container(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: buildButtomSheet(),
          ),
        ),
      ),
    );
  }
}
