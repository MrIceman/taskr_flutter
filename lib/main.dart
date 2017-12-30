import 'package:flutter/material.dart';

void main() => runApp(new ToDoApp(title: 'Taskr'));

class ToDoApp extends StatelessWidget {
  final String title;

  ToDoApp({this.title}){}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        home: new Scaffold(
          appBar: new AppBar(title: new Text(title)),
        )
    );
  }
}