import 'dart:collection';

import 'package:appbrewery/todoey/models/task.dart';
import 'package:flutter/foundation.dart';

class TasksData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'buy milk'),
    Task(name: 'buy break'),
    Task(name: 'buy eggs'),
  ];

  void addTask(String newTaskTitle) {
    _tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void completeTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(int idx) {
    _tasks.removeAt(idx);
    notifyListeners();
  }
}
