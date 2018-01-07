import 'package:taskr_flutter/data/Task.dart';
import 'package:taskr_flutter/data/repository/DataModel.dart';

class TaskBoard extends DataModel {
  static final String ID = 'id';
  static final String SECRET = 'secret';
  static final String TASKS = 'tasks';
  static final String TITLE = 'title';
  static final String DESCRIPTION = 'description';
  static final String PUBLIC_KEY = 'public_id';
  static final String CREATED_ON = 'created_on';
  static final String MAX_TASKS = 'max_tasks';
  static final String LAST_UPDATE = 'last_update';

  int _id, _maxTasks;
  String _secret, _title, _publicKey, _description;
  List<Task> _tasks;
  DateTime _createdOn, _lastUpdate;


  get description => _description;

  set description(value) {
    _description = value;
  }

  get lastUpdate => _lastUpdate;

  set lastUpdate(value) {
    _lastUpdate = value;
  }

  get maxTasks => _maxTasks;

  set maxTasks(value) {
    _maxTasks = value;
  }

  DateTime get createdOn => _createdOn;

  set createdOn(DateTime value) {
    _createdOn = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  get publicKey => _publicKey;

  set publicKey(value) {
    _publicKey = value;
  }

  String get secret => _secret;

  set secret(String value) {
    _secret = value;
  }

  List<Task> get tasks => _tasks;

  get title => _title;

  set title(value) {
    _title = value;
  }

  //-1 is a default value
  TaskBoard({int customId: -1}) {
    if (customId == -1)
      _id = new DateTime.now().millisecond;
    else
      this.id = customId;
    _tasks = new List<Task>();
  }

  void addTask(Task task) {
    _tasks.add(task);
  }


}