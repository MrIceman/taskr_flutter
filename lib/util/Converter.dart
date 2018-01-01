import 'package:taskr_flutter/data/Task.dart';
import 'package:taskr_flutter/data/TaskBoard.dart';

class Converter {
  static String taskToJson(Task task) {
    return "";
  }

  static TaskBoard jsonToTaskBoard(String taskboardJson) {
    return new TaskBoard();
  }

  static Task jsonToTask(String taskJson) {
    return new Task(null, null, null, null);
  }
}