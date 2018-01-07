import 'package:taskr_flutter/data/TaskBoard.dart';
import 'package:taskr_flutter/data/TaskFactory.dart';
import 'package:taskr_flutter/data/repository/RepositoryManager.dart';
import 'package:taskr_flutter/data/repository/local/PreferenceManager.dart';
import 'package:taskr_flutter/taskboard/taskboard/TaskBoardContract.dart';

class TaskBoardPresenter extends TaskBoardPresenterContract {
  final TaskBoardViewContract _view;
  RepositoryManager _repositoryManager;
  PreferenceManager _prefManager;

  TaskBoardPresenter(this._view) {
    _repositoryManager = new RepositoryManager();
    _prefManager = new PreferenceManager();
  }

  @override
  void createTaskBoard(Map data) {
    _repositoryManager.createTaskBoard(
        TaskFactory.createTaskBoard(data[TaskBoard.SECRET],
            data[TaskBoard.TITLE],
            data[TaskBoard.TASKS],
            id: data[TaskBoard.ID]));
  }

  @override
  void deleteTaskBoard(int id, String secret) {
    TaskBoard board = _repositoryManager.getBoardById(id);
    //Verifying that Secret matches
    if (board.secret != secret) {
      _view.onTaskBoardDeleted(false, msg: 'Secret does not match.');
      return;
    }

    _repositoryManager.deleteTaskBoard(id).then((result) {
      _view.onTaskBoardDeleted(result);
    });
  }

  @override
  void joinTaskBoard(int id, String secret) {
    // TODO: implement joinTaskBoard
  }

  @override
  void updateTaskBoard(int id) {
    // TODO: implement updateTaskBoard
  }

  @override
  void getTaskBoards() {
    _repositoryManager.getTaskBoards(publicKeys: ['Mindy']).then((result) {
      print('Received a Result!');
      _view.displayTaskBoards(result);
    });
  }
}