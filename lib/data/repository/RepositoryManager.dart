import 'dart:async';

import 'package:taskr_flutter/data/Task.dart';
import 'package:taskr_flutter/data/TaskBoard.dart';
import 'package:taskr_flutter/data/repository/Repository.dart';
import 'package:taskr_flutter/data/repository/local/LocalDatabase.dart';
import 'package:taskr_flutter/data/repository/remote/DataManager.dart';
import 'package:taskr_flutter/data/repository/remote/TaskRepository.dart';


/// The RepositoryManager accesses the remote and local repository.
/// Each function accesses a layer and the local, remote and localAndRemote parameters determine
/// which layer to use.
class RepositoryManager {
  Repository local;
  TaskRepository remote;
  static RepositoryManager _instance;

  _RepositoryManager() {
    local = new LocalDatabase();
    remote = new TaskRepository(new DataManager());
  }

  static RepositoryManager getInstance() {
    if (_instance == null)
      _instance = new RepositoryManager();
    return _instance;
  }

  Future<bool> createTaskBoard(TaskBoard board,
      {bool remote: false, bool local: false, bool localAndRemote: true}) {
    return new Future(() {
      this.remote.createTaskBoard(board);
    });
  }

  Future<bool> deleteTaskBoard(int boardId,
      {bool remote: false, bool local: false, bool localAndRemote: true}) {
    return new Future(() {
      //todo
    });
  }

  Future<List<TaskBoard>> getTaskBoards(
      {List<String> publicKeys, bool remote: true, bool local: false}) async {
    List<TaskBoard> boards = await this.remote.getTaskBoards(
        publicKeys: publicKeys);
    return boards;
  }

  List<Task> getTasks({bool remote: true, bool local: false}) {
    // TODO: implement getTasks
    return null;
  }

  void updateTaskBoard(TaskBoard board,
      {bool remote: true, bool local: false}) {
    // TODO: implement updateTaskBoard
  }

  TaskBoard getBoardById(int id,
      {bool remote: true, bool local: false}) {
    return new TaskBoard();
  }
}