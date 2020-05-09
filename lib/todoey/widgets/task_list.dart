import 'package:appbrewery/todoey/models/tasks_data.dart';
import 'package:appbrewery/todoey/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, idx) {
            final task = taskData.tasks[idx];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskData.completeTask(task);
              },
              longPressCallback: () {
                taskData.deleteTask(idx);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
