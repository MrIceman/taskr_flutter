import 'package:taskr_flutter/data/Task.dart';
import 'package:taskr_flutter/data/TaskBoard.dart';
import 'package:taskr_flutter/data/repository/Repository.dart';

class LocalDatabase extends Repository{

  @override
  void createTaskBoard(TaskBoard board) {
    // TODO: implement createTask
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