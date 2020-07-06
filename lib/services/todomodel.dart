import 'package:rahulassignment1/services/networking.dart';
import '../constants.dart';

const openWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather';

class ToDoModel {
  List<Todo> todosList;
  ToDoModel({this.todosList});

  factory ToDoModel.fromJson(List<dynamic> parsedJson) {
    List<Todo> todosList = new List<Todo>();
    todosList = parsedJson.map((i) => Todo.fromJson(i)).toList();

    return new ToDoModel(todosList: todosList);
  }

  Future<List<Todo>> getToDoList() async {
    NetworkHelper networkHelper = NetworkHelper(TODOs_URL);
    try {
      var weatherData = await networkHelper.getToDoList();
      return weatherData;
    } catch (e) {
      throw Exception();
    }
  }
}

class Todo {
  int userId;
  int id;
  String title;
  bool completed;

  Todo({this.userId, this.id, this.title, this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        completed: json['completed']);
  }
}
