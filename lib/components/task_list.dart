import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'task_data.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return
        ListView.builder(itemBuilder: (context, i) {
          final task = taskData.tasks[i];
          return TaskTile(taskname: task.myTask,
              changeval: task.isdone,
              checkboxCallBack: (bool? val) {
                taskData.updateTask(task);
              },
              funcLongpress: (){
                taskData.deleteTask(task);
              },
          );
        },
          itemCount: Provider.of<TaskData>(context).tasks.length,
        );
      }
    );
  }
}