import 'dart:async';

import 'package:taskr_flutter/data/TaskBoard.dart';
import 'package:taskr_flutter/data/TaskFactory.dart';
import 'package:taskr_flutter/data/repository/RepositoryManager.dart';
import 'package:taskr_flutter/taskboard/taskboard/TaskBoardContract.dart';
import 'package:taskr_flutter/util/Converter.dart';

class TaskBoardCreatePresenterImpl extends TaskBoardCreatePresenter {
  RepositoryManager _repositoryManager;

  TaskBoardCreatePresenterImpl() {
    _repositoryManager = RepositoryManager.getInstance();
  }

  @override
  Future<bool> createTaskBoard(Map<String, String> data) {
    TaskBoard board = TaskFactory.createTaskBoard(
        data[TaskBoard.SECRET],
        data[TaskBoard.TITLE],
        data[TaskBoard.DESCRIPTION],
        publicKey: data[TaskBoard.PUBLIC_KEY],
        createdOn: Converter.convertBackendDate(data[TaskBoard.CREATED_ON]),
        lastUpdate: Converter.convertBackendDate(data[TaskBoard.LAST_UPDATE]),
        maxTasks: int.parse(data[TaskBoard.MAX_TASKS]));
    return _repositoryManager.createTaskBoard(board);
  }


}