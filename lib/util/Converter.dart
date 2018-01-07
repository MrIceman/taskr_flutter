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
    return JSON.encode(data);
  }

  static DateTime convertBackendDate(String date)
  {
    //todo
    return new DateTime.now();
  }

  static String taskBoardToJson(TaskBoard board) {
    /**
     * Custom Json Data:
     * {"title": "Family Nowosad", "description": "This is our personal TaskBoard",
     * "secret": "secret password", "public_id": "public_id"
     */
    Map data = new Map();
    List<String> taskJsonList = new List();
    for (Task t in board.tasks) {
      String json = taskToJson(t);
      taskJsonList.add(json);
    }
    data[TaskBoard.SECRET] = board.secret;
    data[TaskBoard.TITLE] = board.title;
    data[TaskBoard.ID] = board.id;
    data[TaskBoard.DESCRIPTION] = board.description;
    data[TaskBoard.PUBLIC_KEY] = board.publicKey;
    return JSON.encode(data);
  }

  static TaskBoard jsonToTaskBoard(String taskboardJson) {
    String secret, title, publicKey, description;
    int id, maxTasks;
    DateTime createdOn, lastUpdate;

    Map json = JSON.decode(taskboardJson);

    secret = json[TaskBoard.SECRET];
    title = json[TaskBoard.TITLE];
    publicKey = json[TaskBoard.PUBLIC_KEY];
    description = json[TaskBoard.DESCRIPTION];
    publicKey = json[TaskBoard.PUBLIC_KEY];
    id = json[TaskBoard.ID];
    maxTasks = json[TaskBoard.MAX_TASKS];
    createdOn = json[TaskBoard.CREATED_ON];
    lastUpdate = json[TaskBoard.LAST_UPDATE];

    return TaskFactory.createTaskBoard(secret, title, null);
  }

  static Map parseTaskJsonAsMap(String taskJson) {
    Map json = JSON.decode(taskJson);
    return json;
  }

  static Map parseTaskBoardJsonAsMap(String taskJson) {
    Map json = JSON.decode(taskJson);
    return json;
  }

  static List parseTaskJsonAsList(String taskJson) {
    List json = JSON.decode(taskJson);
    return json;
  }
}