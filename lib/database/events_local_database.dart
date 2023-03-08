import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test1/Model/local_events_model.dart';

class EventsLocalDataBase with ChangeNotifier {
  // List<LocalEventModel> readData = [];
  static Future databasepath() async {
    var databasepath = await getDatabasesPath();
    String path = join(databasepath, "events.db");
    return await openDatabase(path, version: 1, onCreate: onCreateFunction);
  }

  static const tableName = 'events';
  static Future onCreateFunction(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';
    final realType = 'REAL NOT NULL';

    final eventSql = '''CREATE TABLE $tableName(
        id $idType, 
        event_name $textType, 
        event_splashImageUrl $textType,
        event_logoImageUrl $textType,
        event_location $textType, 
        event_date $textType,
        event_lattitude $textType,
        event_longitude $textType,
        event_appOverViewDescription $textType
        )''';
    return await db.execute(eventSql);
  }

  static Future insertEventData(LocalEventModel localEventModel) async {
    Database db = await EventsLocalDataBase.databasepath();
    var result = await db.insert('events', localEventModel.toMap());
    print("result that are inserted: $result");
    // notifyListeners();

    return result;
  }

  // List<LocalEventModel> readEventlist= [];
  // List<LocalEventModel> get readData => readEventlist;
  Future<List<LocalEventModel>> readEventData() async {
    List<LocalEventModel> eventLocalDataList = [];
    Database database = await EventsLocalDataBase.databasepath();
    var queryName = await database.query('events');
    List<LocalEventModel> readData = queryName.isNotEmpty
        ? queryName.map((e) => LocalEventModel.fromMap(e)).toList()
        : [];
    notifyListeners();
    print("all the data :${readData.length}");
    return readData;
    /*queryName.forEach((element) {
      var result = LocalEventModel.fromMap(element);
      eventLocalDataList.add(result);
    });
    return eventLocalDataList;*/
  }

  static Future<int> updateIndex(LocalEventModel localEventModel) async {
    Database db = await EventsLocalDataBase.databasepath();
    return await db.update(tableName, localEventModel.toMap(),
        where: 'id=?', whereArgs: [localEventModel.id]);
  }

  static Future<int> deleteEventsDataBase() async {
    Database db = await EventsLocalDataBase.databasepath();
    return await db.delete(tableName);
  }
}
