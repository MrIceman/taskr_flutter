import 'package:taskr_flutter/data/Task.dart';
import 'package:taskr_flutter/data/TaskBoard.dart';
import 'package:taskr_flutter/util/Converter.dart';

class TaskFactory {
  static TaskBoard createTaskBoard(String secret, String title,
      List<Task> tasks, {int id: -1}) {
    TaskBoard board = new TaskBoard();
    if (secret != null)
      board.secret = secret;
    board.id = id;
    board.title = title;
    for (Task t in tasks)
      board.addTask(t);

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

  static TaskBoard createTaskBoardFromJson(String json) {
    Map data = Converter.parseTaskBoardJsonAsMap(json);
    String secret = data[TaskBoard.SECRET] ?? "";
    String title = data[TaskBoard.TITLE] ?? "Unknown";
    int id = data[TaskBoard.ID] ?? -1;
    List<Task> taskList = new List();
    //todo handle NP exception
    for (String val in Converter.parseTaskJsonAsList(data[TaskBoard.TASKS])) {
      Task task = createTaskFromJson(val);
      taskList.add(task);
    }

    return createTaskBoard(secret, title, taskList);
  }
}