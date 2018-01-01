import 'package:flutter/material.dart';
import 'package:taskr_flutter/data/TaskBoard.dart';

/**
 * This is the View Contract for the Home-Screen which will be displaying
 * a list of TaskBoards
 */
abstract class TaskBoardViewContract extends StatefulWidget {
  void displayTaskBoards(List<TaskBoard> data);

  void onTaskBoardCreated(bool result, {String msg});

  void onTaskBoardDeleted(bool result, {String msg});

  void onTaskBoardJoined(bool result, {String msg});
}

abstract class TaskBoardPresenterContract {
  void createTaskBoard(Map<String, String> data);

  void joinTaskBoard(int id, String secret);

  void deleteTaskBoard(int id, String secret);

  void updateTaskBoard(int id);

}
