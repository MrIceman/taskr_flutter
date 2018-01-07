import 'dart:async';

import 'package:taskr_flutter/data/Task.dart';
import 'package:taskr_flutter/data/TaskBoard.dart';
import 'package:taskr_flutter/data/repository/DataModel.dart';

abstract class Repository extends DataObservable {
  List<Task> getTasks();

  List<DataObserver> observerList;


  void createTaskBoard(TaskBoard board);

  void deleteTaskBoard(TaskBoard board);

  void updateTaskBoard(TaskBoard board);

  @override
  void subscribe(DataObserver observer) {
    if (observerList == null)
      observerList = new List();
    if (!observerList.contains(observer))
      observerList.add(observer);
  }

  @override
  void unsubscribe(DataObserver observer) {
    if (observerList == null)
      observerList = new List();
    if (observerList.contains(observer))
      observerList.remove(observer);
  }
}

abstract class DataObserver {
  void update(List<DataModel> data);
}

abstract class DataObservable {
  void subscribe(DataObserver observer);

  void unsubscribe(DataObserver observer);
}