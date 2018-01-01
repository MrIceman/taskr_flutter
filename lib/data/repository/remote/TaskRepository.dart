import 'package:taskr_flutter/data/Task.dart';
import 'package:taskr_flutter/data/TaskBoard.dart';
import 'package:taskr_flutter/data/repository/Repository.dart';
import 'package:taskr_flutter/data/repository/remote/DataManager.dart';
import 'package:taskr_flutter/util/Converter.dart';

// This Class Holds Data from the Backend, e.g. all TaskBoards and its Tasks
class TaskRepository extends Repository {
  List<TaskBoard> taskBoards;
  final String _apiLink = "";
  DataManager dataManager;

  TaskRepository(DataManager dataManager) {
    this.dataManager = dataManager;
  }

  @override
  void createTask(Task task) {
    dataManager.execute(Converter.taskToJson(task), DataManager.ACTION_CREATE);
  }

  @override
  void deleteTask(Task task) {
    // TODO: implement deleteTask
    dataManager.execute(Converter.taskToJson(task), DataManager.ACTION_DELETE);
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