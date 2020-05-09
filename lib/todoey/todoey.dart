import 'package:appbrewery/todoey/models/tasks_data.dart';
import 'package:appbrewery/todoey/screens/task_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Todoey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TasksData(),
      child: MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}
