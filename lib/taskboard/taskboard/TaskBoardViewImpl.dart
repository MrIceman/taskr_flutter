import 'package:flutter/material.dart';
import 'package:taskr_flutter/TaskrScaffold.dart';
import 'package:taskr_flutter/data/TaskBoard.dart';
import 'package:taskr_flutter/taskboard/taskboard/TaskBoardContract.dart';
import 'package:taskr_flutter/taskboard/taskboard/TaskBoardPresenterImpl.dart';

class TaskBoardView extends TaskBoardViewContract {
  TaskBoardPresenter _presenter;

  TaskBoardView() {
    this._presenter = new TaskBoardPresenter(this);
  }

  @override
  void displayTaskBoards(List<TaskBoard> data) {
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

  Widget createContent() {
    return new ListView(

    );
  }


  @override
  TaskBoardState createState() {
    return new TaskBoardState();
  }
}

class TaskBoardState extends State<TaskBoardView> {

  @override
  Widget build(BuildContext context) {
    return new TaskrScaffold(title: 'TaskBoards', body: new Text('My friend?'));
  }
}