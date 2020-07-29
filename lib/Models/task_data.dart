import 'package:flutter/foundation.dart';
import 'package:todoet/Models/task.dart';
import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskData extends ChangeNotifier {
  
  List<Task> _tasks = [];
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void Updatetask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void Deletetask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
