import 'package:flutter/material.dart';

class TaskrScaffold extends StatelessWidget {
  final String title;
  final Widget body;


  TaskrScaffold({this.title, this.body});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(title),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.settings), onPressed: () {
            print('Show settings');
          }),
        ],),
      body: body,
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: new IconButton(
                icon: new Icon(Icons.dashboard), onPressed: () {
                print('Showing Taskboard');
              },),
              title: new Text('Taskboard')),
          new BottomNavigationBarItem(
              icon: new IconButton(
                icon: new Icon(Icons.note), onPressed: () {
                print('Showing Notes');
              },),
              title: new Text('Notes')),
          new BottomNavigationBarItem(
              icon: new IconButton(
                icon: new Icon(Icons.history), onPressed: () {
                print('Showing Activity');
              },),
              title: new Text('Activities')),
        ],),
    );
  }
}
