import 'dart:async';

import 'package:taskr_flutter/data/Task.dart';
import 'package:taskr_flutter/data/TaskBoard.dart';
import 'package:taskr_flutter/data/TaskFactory.dart';
import 'package:taskr_flutter/data/repository/Repository.dart';
import 'package:taskr_flutter/data/repository/remote/DataManager.dart';
import 'package:taskr_flutter/util/Converter.dart';


class LocalDatabase extends Repository {
  DataManager _dataManager;

  @override
  Future<bool> createTaskBoard(TaskBoard board) {
    return _dataManager.execute(
        Converter.taskBoardToJson(board), DataManager.ACTION_CREATE);
  }

  @override
  void deleteTaskBoard(TaskBoard board) {
    // TODO: implement deleteTask
  }

  @override
  List<TaskBoard> getTaskBoards() {
    // TODO: implement getTaskBoards
    return new List();
  }

  @override
  List<Task> getTasks() {
    // TODO: implement getTasks
    return new List();
  }

  @override
  void updateTaskBoard(TaskBoard board) {
    // TODO: implement updateTask
  }
}