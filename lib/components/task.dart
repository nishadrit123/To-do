class Task{
  Task({required this.myTask, required this.isdone});

  String myTask;
  bool isdone;

  void setdone(){
    isdone = ! isdone;
    return;
  }
}