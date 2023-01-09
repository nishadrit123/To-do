import 'package:flutter/material.dart';
import 'task_list.dart';
import 'package:provider/provider.dart';
import 'task_data.dart';

class FrontScreen extends StatefulWidget {
  const FrontScreen({Key? key}) : super(key: key);

  @override
  State<FrontScreen> createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  Widget mybuild(BuildContext context){
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        padding: const EdgeInsets.all(40.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
        child: Column(
          children: <Widget>[
            const Text('Add Tasks', style: TextStyle(
                color: Colors.lightBlueAccent,
              fontSize: 40.0,
              fontWeight: FontWeight.bold
            ),
            ),
            TextField(
              textCapitalization: TextCapitalization.sentences,
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (val){
                newTaskTitle = val;
              },
            ),
            const SizedBox(height: 30.0,),
            TextButton(
                onPressed: (){
                  Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(backgroundColor: Colors.lightBlueAccent),
                child: const Text('Add', style: TextStyle(color: Colors.white, fontSize: 25.0),)
            )
          ],
        ),
      ),
    );
  }

  String newTaskTitle = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context, isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                  child:Container(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: mybuild(context),
                  )
              ));
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30.0,
                    child: Icon(Icons.list, size: 30.0, color: Colors.lightBlueAccent,),
                ),
                const SizedBox(height: 10.0,),
                const Text(
                  'ToDo',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                  ),
                ),
                const SizedBox(height: 5.0,),
                Text(
                  '  ${Provider.of<TaskData>(context).tasks.length} Tasks',
                  style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))
            ),
            child: const TaskList(),
          ),
          )
        ],
      ),
    );
  }
}



