import 'package:taskr_flutter/data/Task.dart';
import 'package:taskr_flutter/data/TaskBoard.dart';
import 'package:taskr_flutter/data/repository/Repository.dart';
import 'package:taskr_flutter/data/repository/local/LocalDatabase.dart';
import 'package:taskr_flutter/data/repository/remote/DataManager.dart';
import 'package:taskr_flutter/data/repository/remote/TaskRepository.dart';


/**
 * The RepositoryManager accesses the remote and local repository.
 * Each function accesses a layer and the local, remote and localAndRemote parameters determine
 * which layer to use.
 */
class RepositoryManager {
  Repository local, remote;

  RepositoryManager() {
    local = new LocalDatabase();
    remote = new TaskRepository(new DataManager());
  }

  void createTaskBoard(TaskBoard board,
      {bool remote: false, bool local: false, bool localAndRemote: true}) {
    // TODO: implement createTaskBoard
  }

  void deleteTaskBoard(TaskBoard board,
      {bool remote: false, bool local: false, bool localAndRemote: true}) {
    // TODO: implement deleteTaskBoard
  }

  List<TaskBoard> getTaskBoards({bool remote: true, bool local: false}) {
    // TODO: implement getTaskBoards
    return null;
  }

  List<Task> getTasks({bool remote: true, bool local: false}) {
    // TODO: implement getTasks
    return null;
  }

  void updateTaskBoard(TaskBoard board,
      {bool remote: true, bool local: false}) {
    // TODO: implement updateTaskBoard
  }
}