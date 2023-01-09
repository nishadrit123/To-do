import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.changeval, required this.taskname, required this.checkboxCallBack, required this.funcLongpress});

  final bool changeval;
  final String taskname;
  final ValueChanged<bool?> checkboxCallBack;
  final VoidCallback funcLongpress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: funcLongpress,
      title: Text(taskname, style: TextStyle(decoration: changeval ? TextDecoration.lineThrough : null),),
      trailing: Checkbox(value: changeval, onChanged: checkboxCallBack),
    );
  }
}

// void checkboxState(bool? val) {
//   if (val != null) {
//     setState(() {
//       changeval = val;
//     });
//   }
// }

