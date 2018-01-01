import 'package:taskr_flutter/data/Task.dart';

class TaskBoard {
  int _id;
  String _secret;
  List<Task> _tasks;

  TaskBoard() {
    id = new DateTime.now().millisecond;
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


}