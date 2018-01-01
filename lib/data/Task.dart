class Task {
  static final String ID = "task_id";
  static final String TITLE = "task_title";
  static final String CONTENT = "task_content";
  static final String DATE = "task_date";
  static final String LOCAL_TASK = "task_local";

  int _id;
  String _title, _content;
  DateTime _date;
  bool _localTask;

  Task() {
    DateTime now = new DateTime.now();
    _id = now.millisecond;
    _date = now;
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