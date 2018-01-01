//The DataManagers purpose is to communicate with the Backend and delegate responses


import 'dart:async';

class DataManager {
  String _api = '';
  static int ACTION_CREATE = 0;
  static int ACTION_UPDATE = 1;
  static int ACTION_DELETE = 2;

  Future execute(String jsonTask, int action)async {
    var hello = await saySomething();
    return null;
  }

  Future makeRequest()
  {
    return null;
  }

   saySomething(){
    return new Future((){

    });
  }
}