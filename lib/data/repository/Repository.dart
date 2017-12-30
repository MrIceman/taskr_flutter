import 'package:taskr_flutter/data/Task.dart';
import 'package:taskr_flutter/data/TaskBoard.dart';

abstract class Repository{
  List<Task> getTasks();
  List<TaskBoard> getTaskBoards();
  void createTask(Task task);
  void deleteTask(Task task);
  void updateTask(Task task);
}