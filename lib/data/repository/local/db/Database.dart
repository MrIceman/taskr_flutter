import 'dart:async';

import 'package:taskr_flutter/data/repository/DataModel.dart';

abstract class Database {
  Future<DataModel> insert(String query);

  Future<DataModel> update(String query);

  // -1 means get al
  Future<List<DataModel>> get({int id: -1});

  Future<bool> delete(String query);


}