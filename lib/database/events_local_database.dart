import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class EventsLocalDataBase {
  static Future databasepath() async {
    var databasepath = await getDatabasesPath();
    String path = join(databasepath, "events.db");
    return await openDatabase(path, version: 1, onCreate: onCreateFunction);
  }

  static Future onCreateFunction(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';
    final realType = 'REAL NOT NULL';

    final eventSql =
        '''CREATE TABLE EVENTS (id $idType, event_name $textType, event_location $textType, event_date $textType)''';
    return await db.execute(eventSql);
  }
}
