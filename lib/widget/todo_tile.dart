import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  ToDoTile({this.userId, this.id, this.title, this.completed});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Title : $title',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Text('Complete Status : '),
                    completed
                        ? Icon(
                            Icons.check,
                            color: Colors.green,
                          )
                        : Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                  ],
                )
              ],
            ),
            padding: EdgeInsets.all(15.0)));
  }
}
