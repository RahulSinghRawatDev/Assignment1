import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rahulassignment1/services/todomodel.dart';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future<List<Todo>> getToDoList() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Todo> todoList = ToDoModel.fromJson(data).todosList;
      return todoList;
    } else {
      throw Exception();
    }
  }
}
