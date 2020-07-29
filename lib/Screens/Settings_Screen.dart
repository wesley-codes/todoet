import 'package:flutter/material.dart';
import 'package:todoet/Screens/ChangeDetails_Screen.dart';
import 'package:todoet/Screens/Password_Screen.dart';


class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

          body:Container(
            color:Colors.white,
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
                   
           
               Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          
        children: <Widget>[
          Center(child:    Text("SETTINGS", style: TextStyle(
            fontSize: 30,
            fontWeight:FontWeight.w700,
            color: Color(0xFF2F4858)
          ),),),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(left: 19,right: 18),
            child: Buttons(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>changeDetails()));
              },
              buttonName: ("Change Details"),
            ),
          ),
          SizedBox(height: 40),
          Padding(
           padding: const EdgeInsets.only(left: 19,right: 18),
            child: Buttons(
              onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>password()));
              },
              buttonName: ("Change Password"),
            ),
          ),    SizedBox(height: 40),
          Padding(
           padding: const EdgeInsets.only(left: 19,right: 18),
            child: Buttons(
              onPressed: (){},
              buttonName: ("LogOut"),
            ),
          )
        ],
      ),
        Positioned(
              bottom: -70,
              right: -100,
              child: Image.asset('images/Ellipse 1.png'),
              
              ),     ],)
          
          )
    );
  }
}

class Buttons extends StatelessWidget {
 Buttons({@required this.onPressed , @required this.buttonName});
 final String buttonName;
 final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 50,
          child: Material(
            elevation: 5.0,
                      child: FlatButton(
              onPressed: onPressed,
               child: Text(buttonName,
               style: TextStyle(
                 fontSize: 20,
                  color: Color(0xFF2F4858),
                  fontWeight: FontWeight.bold),
                  ),
                     shape:   RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  side: BorderSide(color: Color(0xFF2F4858),),),
      ),
          ),
    );
    }
}