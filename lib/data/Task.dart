import 'package:taskr_flutter/data/repository/DataModel.dart';

class Task extends DataModel {
  static final String ID = "id";
  static final String TITLE = "title";
  static final String CONTENT = "content";
  static final String DATE = "tdate";
  static final String AUTHOR = 'author';
  static final String TASKBOARD_ID = 'taskboard_id';

  int _id;
  String _title, _content, _author;
  DateTime _date;
  bool _localTask;

  Task() {
    DateTime now = new DateTime.now();
    _id = now.millisecond;
    _date = now;
  }


  get author => _author;

  set author(value) {
    _author = value;
  }

  bool get localTask => _localTask;

  set localTask(bool value) {
    _localTask = value;
  }

  DateTime get date => _date;

  set date(DateTime value) {
    _date = value;
  }

  get content => _content;

  set content(value) {
    _content = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }


}
