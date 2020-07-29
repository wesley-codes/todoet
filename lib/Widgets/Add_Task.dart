

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoet/Models/task_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

TextEditingController _controller = TextEditingController();



class buildButtomSheet extends StatefulWidget {
  @override
  _buildButtomSheetState createState() => _buildButtomSheetState();
}

class _buildButtomSheetState extends State<buildButtomSheet> {

_showDialog(){
  return showDialog(context: context,
  builder: (BuildContext context){
    return AlertDialog(
      title: Text("No Task"),
      content: Text("Please input new task"),
      actions: <Widget>[
        FlatButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text("OK"))
      ],
    );
  }
  );
}

  @override
  Widget build(BuildContext context) {
  String newTaskTitle = '';
    return Container(
        color: Color(0xff757575),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Add Task",
                  style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: _controller,
                  
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    autofocus: true,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.deepOrangeAccent,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepOrangeAccent)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepOrangeAccent))),
                    onChanged: (newText) {
                      newTaskTitle = newText;
                    
                    },
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Material(
                  color: Colors.deepOrangeAccent,
                  elevation: 10.0,
                  borderRadius: BorderRadius.circular(10.0),
                  child: FlatButton(
                    child: Text(
                      "Add Task",
                     
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    color: Colors.deepOrangeAccent,
                    
                    onPressed: () {
                    if (newTaskTitle != '' ){
                      Provider.of<TaskData>(context, listen:false).addTask(newTaskTitle);
                      Navigator.pop(context);
                    }
           else _showDialog();

                    },
                  ),
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0))),
        ));
  }
}
