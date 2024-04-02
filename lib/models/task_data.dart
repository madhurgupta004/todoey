// ignore_for_file: prefer_final_fields

import 'package:flutter/foundation.dart';
import 'package:todomate/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    // Task(name: 'Contest'),
    // Task(name: 'DSA'),
    // Task(name: 'Flutter'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String taskName) {
    final task = Task(name: taskName);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
