import 'package:taskr_flutter/data/Task.dart';
import 'package:taskr_flutter/data/TaskBoard.dart';

abstract class Repository{
  List<Task> getTasks();
  List<TaskBoard> getTaskBoards();
  void createTaskBoard(TaskBoard board);
  void deleteTaskBoard(TaskBoard board);
  void updateTaskBoard(TaskBoard board);
}