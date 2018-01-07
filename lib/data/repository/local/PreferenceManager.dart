import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskr_flutter/taskboard/taskboard/TaskBoardPresenterImpl.dart';

class PreferenceManager {
  SharedPreferences _prefs;

  Future<Null> storeTaskBoardId(String id) async {
    _prefs = await SharedPreferences.getInstance();
    List<String> taskBoards = _prefs.getStringList('taskBoards');
    if (taskBoards.contains(id))
      return;
    taskBoards.add(id);
    _prefs.setStringList('taskBoards', taskBoards);
    _prefs.commit().whenComplete(() {
      print('Stored Values');
    });
  }

  Future<String> getUserName() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getString('username');
  }

  Future<Null> setUserName(String username) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setString('username', username);
  }

  void isFirstLaunch(TaskBoardPresenter presenter) {
    SharedPreferences.getInstance().then((prefs) {
      var result = prefs.getBool('was_launched_already');
      presenter.onFirstLaunch(result == null || result == false);
    });
  }

  void onFirstLaunch() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('was_launched_already', true);
    });
  }


  Future<List<String>> getPublicKeys(String key) async {
    _prefs = await SharedPreferences.getInstance();
    List<String> keys = _prefs.getStringList('public_keys');
    return keys;
  }

  Future<bool> storePublicKey(String key) async {
    List<String> keys = _prefs.getStringList('public_keys');
    if (keys.contains(key))
      return false;

    keys.add(key);
    _prefs.setStringList('public_keys', keys);
    return true;
  }
}