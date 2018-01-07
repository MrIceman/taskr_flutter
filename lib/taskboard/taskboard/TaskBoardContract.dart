import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taskr_flutter/data/TaskBoard.dart';

/**
 * This is the View Contract for the Home-Screen which will be displaying
 * a list of TaskBoards
 */
abstract class TaskBoardViewContract extends StatefulWidget {
  void displayUsername(String username);

  void displayTaskBoards(List<TaskBoard> data);

  void onTaskBoardCreated(bool result, {String msg});

  void onTaskBoardDeleted(bool result, {String msg});

  void onTaskBoardJoined(bool result, {String msg});

  Future<Null> showFirstLaunchDialog() async {}

  void onFirstLaunch();
}

abstract class TaskBoardPresenterContract {
  void createTaskBoard(Map<String, String> data);

  void joinTaskBoard(int id, String secret);

  void deleteTaskBoard(int id, String secret);

  void updateTaskBoard(int id);

  void getTaskBoards();

  void isFirstLaunch();

  void onFirstLaunch(bool result);

  void setUsername(String username);

  void onViewInitialized();
}
