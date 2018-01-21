import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taskr_flutter/TaskrScaffold.dart';
import 'package:taskr_flutter/data/TaskBoard.dart';
import 'package:taskr_flutter/taskboard/taskboard/TaskBoardContract.dart';
import 'package:taskr_flutter/taskboard/taskboard/TaskBoardPresenterImpl.dart';
import 'package:taskr_flutter/taskboard/taskboard/widgets/CreateBoardWidget.dart';

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
          new Container(
            padding: new EdgeInsets.all(8.0),
            height: 100.0,
            child: new Row(
              children: <Widget>[
                new Column(crossAxisAlignment: CrossAxisAlignment.start
                    , children: <Widget>[
                      new Expanded(child: new Container(child:
                      new Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            new Text(
                              "Today",
                              style: new TextStyle(fontWeight: FontWeight.w400),
                              textAlign: TextAlign.end,),
                          ])),),
                      new Text(taskTitle,
                          style: new TextStyle(fontWeight: FontWeight.w500)),
                      new Divider(color: Colors.grey),
                      new Text(participators)
                    ])
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget getContent({int action: -1}) {
    /**
     * Gets the Main Content
     * if empty > create/join Taskboard Screen
     * else > display list of cards
     *
     * if action is == 1 then a create taskboard screen will be shown
     * if action is == 2 then a join taskboard will be shown
     */
    if (action == 1)
      return new CreateBoardWidget(view: this,);
    if (data.isEmpty)
      return getEmptyContentScreen();
    print('Data is not empty!');
    List<Widget> list = new List();
    for (TaskBoard board in data) {
      list.add(createTaskCard(
          board.title, board.description, board.createdOn.toIso8601String(),
          board.description));
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
    return new Container(
      child: new Center(
          child: new Card(child: new Padding(
              padding: new EdgeInsets.all(16.0), child: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text(
                  'You have no TaskBoard yet. Would you like to create or join a new TaskBoard?'),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new FlatButton(onPressed: (() {
                    print('Creating a Task');
                    listState.updateUi(1);
                  }), child: new Text('Create')),
                  new FlatButton(onPressed: () {
                    print('Joining a Task');
                  }, child: new Text('Join'))
                ],
              )
            ],
          )))),);
  }

  @override
  Future<Null> showFirstLaunchDialog() async {
    TextEditingController controller = new TextEditingController();
    InputDecoration decoration = new InputDecoration(
      icon: new Icon(Icons.account_box),
      hintText: 'Enter your name here',
      labelText: 'Your Name',
    );

    switch (
    await showDialog<String>(
      context: listState.context,
      child:
      new SimpleDialog(
        contentPadding: new EdgeInsets.all(8.0),
        title: new Text('What\'s your name?'),
        children: <Widget>[
          new Text(
            "Welcome, since this is your first start we will need your Name, so your tasks can be identified by your mate(s)",
            style: new TextStyle(
                fontSize: 14.0, decorationColor: Colors.deepPurpleAccent),),
          new TextField(
              decoration: decoration,
              controller: controller,
              autocorrect: false
          ),
          new SimpleDialogOption(
            onPressed: () {
              if (controller.text.trim() != "")
                Navigator.pop(listState.context, "ok");
              else
                return;
            },
            child: new Text('Okay'),
          )
        ],
      ),
    )) {
      case "ok":
        _presenter.setUsername(controller.text);
        break;
    };
  }

  @override
  void onFirstLaunch() {
    // TODO: implement onFirstLaunch
    showFirstLaunchDialog();
  }

  @override
  void displayUsername(String username) {
    listState.updateUsername(username);
  }

  @override
  void createTask(String title, String description,
      {String secret, String publicId}) {
    // TODO: implement createTask
  }
}


class _TaskBoardListState extends State<TaskBoardView> {
  List<TaskBoard> data;
  bool dataUpdated = false;
  String username;
  final int CREATE = 1;
  final int JOIN = 3;
  final int SHOW_ALL = 2;
  int action = -1;

  _TaskBoardListState(this.data);

  void updateData(List<TaskBoard> data) {
    this.setState(() {
      print('Updating setState with data');
      dataUpdated = true;
      if (data.isEmpty)
        return;
      this.data.addAll(data);
    });
  }

  void updateUi(int action) {
    setState(() {
      this.action = action;
    });
  }

  void updateUsername(String username) {
    setState(() {
      this.username = username;
    });
  }

  @override
  void initState() {
    super.initState();
    widget._presenter.onViewInitialized();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(child:
    new TaskrScaffold(
        title: username == null ? 'TaskBoards' : 'Hello, ' + username,
        body: dataUpdated ? widget.getContent(action: action) : widget
            .getLoadingScreen()),
      onWillPop: () {
        print('Pressed Back!');
      },
    );
  }

}