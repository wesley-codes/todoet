


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool ischecked;
  final bool slide;
  final String tasktitle;
  final Function checkboxCallback;
  final Function Delete;

  TaskTile(
      {this.ischecked,
      this.slide,
      this.tasktitle,
      this.checkboxCallback,
      this.Delete});




  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 86,
          child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                duration: Duration(milliseconds: 100),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red[700],
                      ),
                      child: Center(
                        child: Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: IconButton(
                              onPressed: Delete,
                              icon: Icon(
                                Icons.delete,
                                size: 40,
                                color: Colors.black,
                              ),
                            )),
                      ),
                      height: 70.0,
                      width: 80.0,
                    ),
                  ),
                ),
                left: slide ? 0 : 70,
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red[700]),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Center(
                      child: ListTile(
                        
                          title: Text(
                          tasktitle ,

                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20),
                          ),
                          leading: Checkbox(
                            value: ischecked,
                            onChanged: checkboxCallback,
                            activeColor: Colors.green,
                            checkColor: Colors.white,
                          )),
                    ),
                    height: 70,
                    width: MediaQuery.of(context).size.width - 16,
                  ),
                ),
                left: slide ? 62 : 0,
              )
            ],
          ),
        )
      ],
    );
  }
}

//
//
