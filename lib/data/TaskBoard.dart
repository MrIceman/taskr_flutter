import 'package:taskr_flutter/data/Task.dart';

class TaskBoard {
  static final String ID = 'id';
  static final String SECRET = 'secret';
  static final String TASKS = 'tasks';
  static final String TITLE = 'title';

  int _id;
  String _secret, _title;
  List<Task> _tasks;

  //-1 is a default value
  TaskBoard({int customId: -1}) {
    if(customId != -1)
      _id = new DateTime.now().millisecond;
    else
      this.id = customId;
    _tasks = new List<Task>();
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get secret => _secret;

  set secret(String value) {
    _secret = value;
  }

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
  }

  get title => _title;

  set title(value) {
    _title = value;
  }


}