import 'package:flutter/material.dart';
import 'package:taskr_flutter/TaskrScaffold.dart';
import 'package:taskr_flutter/data/TaskBoard.dart';
import 'package:taskr_flutter/taskboard/taskboard/TaskBoardContract.dart';
import 'package:taskr_flutter/taskboard/taskboard/TaskBoardPresenterImpl.dart';

class TaskBoardView extends TaskBoardViewContract {
  TaskBoardPresenter _presenter;
  _TaskBoardListState listState;
  List<TaskBoard> data;

  TaskBoardView() {
    data = new List();
    this._presenter = new TaskBoardPresenter(this);
  }

  @override
  void displayTaskBoards(List<TaskBoard> data) {
    listState.updateData(data);
  }

  void getTaskBoards() {
    _presenter.getTaskBoards();
  }

  @override
  void onTaskBoardCreated(bool result, {String msg}) {

  }

  @override
  void onTaskBoardDeleted(bool result, {String msg}) {
  }

  @override
  void onTaskBoardJoined(bool result, {String msg}) {
  }

  Widget getLoadingScreen() {
    return new Center(
      child: new Container(
          color: Colors.blue,
          child: new Column(
            children: <Widget>[
              new Text('Please wait while we are setting up your TaskBoards.')
            ],
          )),
    );
  }

  Card createTaskCard(String taskTitle, String taskContent, String date,
      String participators) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new ListTile(
              title: new Text(taskTitle,
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              subtitle: new Text(participators)
          )
        ],
      ),
    );
  }

  Widget getContent() {
    if (data.isEmpty)
      return getEmptyContentScreen();
    List<Widget> list = new List();
    for (int i = 0; i < 3; i++) {
      list.add(createTaskCard("Task $i", "Content $i", "000", "i" * i));
    }
    return new Center(
        child: new ListView(
          children: list,
        )
    );
  }

  @override
  _TaskBoardListState createState() {
    listState = new _TaskBoardListState(data);
    return listState;
  }


  Widget getEmptyContentScreen() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[

        new Text(
            'You have no TaskBoard signed up yet. Would you like to create or join a new TaskBoard?'),
        new Row(
          children: <Widget>[
            new FlatButton(onPressed: null, child: new Text('Create')),
            new FlatButton(onPressed: null, child: new Text('Join'))
          ],
        )
      ],
    );
  }

}


class _TaskBoardListState extends State<TaskBoardView> {
  List<TaskBoard> data;
  bool data_updated = false;

  _TaskBoardListState(this.data);

  void updateData(List<TaskBoard> data) {
    this.setState(() {
      print('Updating setState with data');
      data_updated = true;
      if (data.isEmpty)
        return;
      this.data.addAll(data);
    });
  }


  @override
  void initState() {
    super.initState();
    widget.getTaskBoards();
  }

  @override
  Widget build(BuildContext context) {
    return new TaskrScaffold(
        title: 'TaskBoard',
        body: data_updated ? new Container(
            child: new Expanded(child: new Container(child: widget.getContent()))) : widget
            .getLoadingScreen());
  }

}