import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:photo_mapper/core/app_db.dart';
import 'package:sembast/sembast.dart';

class PhotoDao {
  final _dbStore = StoreRef("photosRef");
  get _database async => await Modular.get<AppDatabase>().database;

  Stream<List<RecordSnapshot>> dbListener() {
    var controller = StreamController<List<RecordSnapshot>>();
    _database.then((db) {
      (_dbStore).query().onSnapshots(db).listen((snapshots) {
        // snapshots always contains the list of all the records in the store
        controller.add(snapshots);
      });
    });
    return controller.stream;
  }

  Future<bool> save(Map<String, dynamic> data) async {
    var db = await _database;
    var value = await _dbStore.record(data['id']).put(db, data, merge: true);
    return value != null;
  }

  Future remove(Map<String, dynamic> data) async {
    var db = await _database;
    var filter = Filter.equals('uid', data['uid']);
    var finder = Finder(filter: filter);
    int count = await _dbStore.delete(db, finder: finder);
    return count >= 0;
  }

  Future getRecords() async {
    var db = await _database;
    var records = await _dbStore.find(db);
    return records;
  }

  Future clearDb() async {
    var db = await _database;
    return _dbStore.delete(db);
  }
}
