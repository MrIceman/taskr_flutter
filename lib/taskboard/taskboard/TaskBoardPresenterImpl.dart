import 'package:taskr_flutter/data/repository/RepositoryManager.dart';
import 'package:taskr_flutter/taskboard/taskboard/TaskBoardContract.dart';
import 'package:taskr_flutter/taskboard/taskboard/TaskBoardViewImpl.dart';

class TaskBoardPresenter extends TaskBoardPresenterContract {
  final TaskBoardView _view;
  RepositoryManager _repositoryManager;

  TaskBoardPresenter(this._view) {
    _repositoryManager = new RepositoryManager();
  }

  @override
  void createTaskBoard(Map<String, String> data) {
    // TODO: implement createTaskBoard
  }

  @override
  void deleteTaskBoard(int id, String secret) {
    // TODO: implement deleteTaskBoard
  }

  @override
  void joinTaskBoard(int id, String secret) {
    // TODO: implement joinTaskBoard
  }

  @override
  void updateTaskBoard(int id) {
    // TODO: implement updateTaskBoard
  }
}