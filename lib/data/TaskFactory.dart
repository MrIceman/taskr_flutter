import 'package:taskr_flutter/data/Task.dart';
import 'package:taskr_flutter/data/TaskBoard.dart';

class TaskFactory {
  static TaskBoard createTaskBoard(String secret) {
    TaskBoard board = new TaskBoard();
    if (secret != null)
      board.secret = secret;
    return board;
  }

  static Task createTask(String content, String title,{bool localTask: false}) {
    Task t = new Task();

    t.title = title;
    t.localTask = localTask;
    return t;
  }
}