class Task {
  int id;
  String title, content;
  DateTime date;
  bool localTask;

  Task(this.title, this.content, this.date, this.localTask) {}

  void setId(int id) {
    this.id = id;
  }


}