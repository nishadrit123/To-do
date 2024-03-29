import 'package:flutter/material.dart';
import 'components/front_screen.dart';
import 'package:provider/provider.dart';
import './components/task_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: const MaterialApp(
        home: FrontScreen(),
      ),
    );
  }
}
