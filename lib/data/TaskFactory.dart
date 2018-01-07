import 'package:taskr_flutter/data/Task.dart';
import 'package:taskr_flutter/data/TaskBoard.dart';
import 'package:taskr_flutter/util/Converter.dart';

class TaskFactory {
  static TaskBoard createTaskBoard(String secret, String title,
      String description,
      {String publicKey: 'default', DateTime createdOn, DateTime lastUpdate,
        int maxTasks, List<Task> tasks, int id: -1}) {
    TaskBoard board = new TaskBoard();
    board.secret = secret;
    if (id != -1)
      board.id = id;
    if (createdOn != null)
      board.createdOn = createdOn;

    board.title = title;
    board.publicKey = publicKey;
    board.lastUpdate = lastUpdate;
    board.maxTasks = maxTasks;
    board.description = description;

    if (tasks != null) {
      for (Task t in tasks)
        board.addTask(t);
    }
    return board;
  }

  static Task createTask(String content, String title,
      {bool localTask: false}) {
    Task t = new Task();

    t.title = title;
    t.localTask = localTask;
    return t;
  }

  static Task createTaskFromJson(String json) {
    Map data = Converter.parseTaskJsonAsMap(json);
    String content = data[Task.CONTENT];
    String title = data[Task.TITLE];
    bool localTask = data[Task.LOCAL_TASK];
    DateTime date = new DateTime.fromMillisecondsSinceEpoch(data[Task.DATE]);
    int id = data[Task.DATE];
    return new Task();
  }

  static TaskBoard createTaskBoardFromJson(String jsonString) {
    Map json = Converter.parseTaskBoardJsonAsMap(jsonString);

    String secret, title, publicKey, description;
    int id, maxTasks;
    DateTime createdOn, lastUpdate;

    secret = json[TaskBoard.SECRET];
    title = json[TaskBoard.TITLE];
    publicKey = json[TaskBoard.PUBLIC_KEY];
    description = json[TaskBoard.DESCRIPTION];
    publicKey = json[TaskBoard.PUBLIC_KEY];
    id = json[TaskBoard.ID];
    maxTasks = json[TaskBoard.MAX_TASKS];
    createdOn = json[TaskBoard.CREATED_ON];
    lastUpdate = json[TaskBoard.LAST_UPDATE];

    return createTaskBoard(secret, title, description, publicKey: publicKey,
        createdOn: createdOn,
        lastUpdate: lastUpdate,
        maxTasks: maxTasks,
        tasks: null,
        id: id);
  }
}