import 'package:flutter/material.dart';
import 'package:taskr_flutter/taskboard/taskboard/TaskBoardViewImpl.dart';

void main() => runApp(new ToDoApp(title: 'Taskr'));

class ToDoApp extends StatelessWidget {
  final String title;

  ToDoApp({this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        theme: new ThemeData(primarySwatch: Colors.blueGrey,),
        home: new TaskBoardView()
    );
  }
}