import 'package:flutter/material.dart';
import 'package:rahulassignment1/services/todomodel.dart';
import 'package:rahulassignment1/widget/todo_tile.dart';

class ToDoList extends StatefulWidget {
  final List<Todo> toDo;

  ToDoList({this.toDo});

  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ToDoTile(
            userId: widget.toDo[index].userId,
            id: widget.toDo[index].id,
            title: widget.toDo[index].title,
            completed: widget.toDo[index].completed,
          );
        },
        itemCount: widget.toDo.length,
      ),
    );
  }
}
