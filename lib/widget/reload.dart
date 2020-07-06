import 'package:flutter/material.dart';

class Reload extends StatelessWidget {
  Reload({this.onReloadFun});
  final Function onReloadFun;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Something went wrong',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'Give it another try',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          GestureDetector(
            onTap: onReloadFun,
            child: Text(
              'RELOAD',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent,
              ),
            ),
          )
        ],
      ),
    );
  }
}
