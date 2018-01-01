import 'package:taskr_flutter/data/Task.dart';
import 'package:taskr_flutter/data/TaskBoard.dart';
import 'package:taskr_flutter/data/TaskFactory.dart';

class Converter {
  static String taskToJson(Task task) {
    return "";
  }

  static TaskBoard jsonToTaskBoard(String taskboardJson) {
    String secret;
    return TaskFactory.createTaskBoard(secret);
  }

  static Task jsonToTask(String taskJson) {
    String content, title;
    bool localTask;

    return TaskFactory.createTask(content, title, localTask: localTask);
  }

  static String taskBoardToJson(TaskBoard board) {
    return "";
  }
}