import 'package:flutter/material.dart';
import 'package:rahulassignment1/screens/todolist_screen.dart';

void main() => runApp(MainScreen());

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Todo List', home: ToDoListScreen());
  }
}
