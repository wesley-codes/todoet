import 'package:flutter/material.dart';
import 'package:todoet/Models/task_data.dart';
import 'package:todoet/Screens/home_Screen.dart';
import 'package:provider/provider.dart';


void main(){
 
  runApp(MyApp());} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: homeScreen(),
      ),
    );
  }
}
