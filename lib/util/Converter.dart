import 'package:taskr_flutter/data/Task.dart';
import 'package:taskr_flutter/data/TaskBoard.dart';
import 'package:taskr_flutter/data/TaskFactory.dart';
import 'dart:convert';

class Converter {
  static String taskToJson(Task task) {
    Map data = new Map();
    data[Task.ID] = task.id;
    data[Task.CONTENT] = task.content;
    data[Task.DATE] = task.date;
    data[Task.TITLE] = task.title;
    data[Task.LOCAL_TASK] = task.localTask;
    return JSON.encode(data);
  }

  static String taskBoardToJson(TaskBoard board) {
    Map data = new Map();
    List<String> taskJsonList = new List();
    for (Task t in board.tasks) {
      String json = taskToJson(t);
      taskJsonList.add(json);
    }
    data[TaskBoard.SECRET] = board.secret;
    data[TaskBoard.TITLE] = board.title;
    data[TaskBoard.TASKS] = JSON.encode(taskJsonList);
    data[TaskBoard.ID] = board.id;
    return JSON.encode(data);
  }

  static TaskBoard jsonToTaskBoard(String taskboardJson) {
    String secret, title;
    Map json = JSON.decode(taskboardJson);
    secret = json[TaskBoard.SECRET];
    title = json[TaskBoard.TITLE];
    return TaskFactory.createTaskBoard(secret, title, null);
  }

  static Map parseTaskJsonAsMap(String taskJson) {
    Map json = JSON.decode(taskJson);
    return json;
  }

  static Map parseTaskBoardJsonAsMap(String taskJson){
    Map json = JSON.decode(taskJson);
    return json;
  }

  static List parseTaskJsonAsList(String taskJson) {
    List json = JSON.decode(taskJson);
    return json;
  }
}