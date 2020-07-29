import 'package:flutter/material.dart';
import 'package:todoet/Widgets/Task_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoet/Models/task_data.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
      
return ListView.builder(
          itemBuilder: (context, index) {
            final  task = taskData.tasks[index];
            return TaskTile(
              tasktitle: task.name ,
              ischecked: task.isDone, 
              slide: task.slide,
              checkboxCallback: (checkboxState) {
                taskData.Updatetask(task);
              },
              Delete: () {
                taskData.Deletetask(task);
              },
            );
          },
          itemCount:taskData.taskCount,
        );
      });
      
    
  }

}