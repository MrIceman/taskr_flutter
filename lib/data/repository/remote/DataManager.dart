//The DataManagers purpose is to communicate with the Backend and delegate responses

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:taskr_flutter/data/TaskBoard.dart';
import 'package:taskr_flutter/data/TaskFactory.dart';

class DataManager {
  final String _host = "http://10.0.2.2:5000";
  final String _getPath = '/task/taskboard/get/';
  static int ACTION_CREATE = 0;
  static int ACTION_UPDATE = 1;
  static int ACTION_DELETE = 2;
  DartManager() {
  }

  Future execute(String jsonTask, int action) async {

  }

  Future<TaskBoard> getTaskBoard(String publicKey) async {
    Map<String, String> params = new Map();
    String json = "";
    params[TaskBoard.PUBLIC_KEY] = publicKey;
    var url = _host + _getPath;
    await http.post(url, headers: {'Content-Type': 'Application/Json'},
        body: JSON.encode(params))
        .then((response) {
      print('Received result for TaskBoard with public_id ' + publicKey + ' : ' + response.body);
      json = response.body;
    });

    return TaskFactory.createTaskBoardFromJson(json);
  }

}