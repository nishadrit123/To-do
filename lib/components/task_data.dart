import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier{
    List <Task> tasks = [
    Task(myTask: 'Buy fruits', isdone: false),
    Task(myTask: 'Do HW', isdone: false),
    Task(myTask: 'Get watch', isdone: false),
  ];
  
  void addTask(String newval){
    Task t1 = Task(myTask: newval, isdone: false);
    tasks.add(t1);
    notifyListeners();
  }

  void updateTask(Task t2){
    t2.setdone();
    notifyListeners();
  }

  void deleteTask(Task t3){
    tasks.remove(t3);
    notifyListeners();
  }

}