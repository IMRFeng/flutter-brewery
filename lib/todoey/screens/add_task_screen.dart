import 'package:appbrewery/todoey/models/tasks_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            TextField(
              onChanged: (newText) {
                newTaskTitle = newText;
              },
              onSubmitted: (newText) {
                if (newTaskTitle == null || newTaskTitle == '') {
                  return;
                }
                Provider.of<TasksData>(context, listen: false)
                    .addTask(newTaskTitle);

                Navigator.pop(context);
              },
              autofocus: true,
              textAlign: TextAlign.center,
            ),
            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                if (newTaskTitle == null || newTaskTitle == '') {
                  return;
                }
                Provider.of<TasksData>(context, listen: false)
                    .addTask(newTaskTitle);

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
