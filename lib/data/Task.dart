class Task {
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