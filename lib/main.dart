import 'package:flutter/material.dart';
import 'package:todo_app/pages/HomePage.dart';
import 'package:todo_app/pages/add_todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      routes: {
        'homepage': (context) => HomePage(),
        'add_todo': (context) => AddTodo(),
      },
      initialRoute: 'homepage',
    );
  }
}
