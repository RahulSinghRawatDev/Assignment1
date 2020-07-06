import 'package:flutter/material.dart';
import 'package:rahulassignment1/services/todomodel.dart';
import 'package:rahulassignment1/widget/reload.dart';
import 'package:rahulassignment1/widget/shimmer.dart';
import 'package:rahulassignment1/widget/todo_list.dart';

import '../constants.dart';

class ToDoListScreen extends StatefulWidget {
  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  ToDoModel toDoModel = ToDoModel();
  List<Todo> toDoListData = [];
  bool _isLoading = false, _isError = false;

  @override
  void initState() {
    super.initState();
    callToDoApi();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return buildScreen(ShimmerEffect());
    } else if (_isError) {
      return buildScreen(Reload(
        onReloadFun: () {
          callToDoApi();
        },
      ));
    } else {
      return buildScreen(
        ToDoList(
          toDo: toDoListData,
        ),
      );
    }
  }

  Scaffold buildScreen(Widget body) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          APP_NAME,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: body,
    );
  }

  void callToDoApi() async {
    showProgress();
    var toDoData;
    try {
      toDoData = await toDoModel.getToDoList();
      updateUi(toDoData);
    } catch (e) {
      _isError = true;
    }
    hideProgress();
  }

  void updateUi(List<Todo> toDoData) {
    setState(() {
      _isError = false;
      toDoListData = toDoData;
    });
  }

  void showProgress() {
    setState(() {
      _isLoading = true;
    });
  }

  void hideProgress() {
    setState(() {
      _isLoading = false;
    });
  }
}
