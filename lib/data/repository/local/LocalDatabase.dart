import 'package:taskr_flutter/data/Task.dart';
import 'package:taskr_flutter/data/TaskBoard.dart';
import 'package:taskr_flutter/data/repository/Repository.dart';

class LocalDatabase extends Repository{

  @override
  void createTask(Task task) {
    // TODO: implement createTask
  }

  @override
  void deleteTask(Task task) {
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
  void updateTask(Task task) {
    // TODO: implement updateTask
  }
}