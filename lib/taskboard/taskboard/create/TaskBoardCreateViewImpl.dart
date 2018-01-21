import 'package:flutter/material.dart';
import 'package:taskr_flutter/TaskrScaffold.dart';
import 'package:taskr_flutter/taskboard/taskboard/TaskBoardContract.dart';

class TaskBoardCreateViewImpl extends TaskBoardCreateView {
  TaskBoardCreatePresenter _presenter;

  TaskBoardCreateViewImpl() {

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new TaskrScaffold(
        title: 'Create a new Task',
        body: this);
  }
}