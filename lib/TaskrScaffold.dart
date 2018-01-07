import 'package:flutter/material.dart';

class TaskrScaffold extends StatelessWidget {
  final String title;
  final Widget body;


  TaskrScaffold({this.title, this.body});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(title)),
      body: body,
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add),
          onPressed: () {
            print('Pressed!');
          }),
    );
  }
}
