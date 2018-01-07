import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

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