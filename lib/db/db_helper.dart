import 'package:remindme/models/task.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 4;
  static const String _tableName = 'tasks';

  static initDb() async {
    if (_db != null) {
      return;
    } else {
      try {
        String _path = await getDatabasesPath() + 'tasks.db';
        _db = await openDatabase(
          _path,
          version: _version,
          onCreate: (Database db, int version) async {
            await db.execute('CREATE TABLE $_tableName ('
                'id INTEGER PRIMARY KEY AUTOINCREMENT,'
                'title STRING, note TEXT, isCompleted INTEGER,'
                'date STRING, startTime STRING,'
                'endTime STRING,color INTEGER,remind INTEGER,'
                'repeat STRING)');
          },
        );
      } catch (e) {
        print(e);
      }
    }
  }

  static Future<int> insert(Task? task) async {
    return await _db!.insert(_tableName, task!.toJson());
  }

  static Future<int> delete(Task task) async {
    return await _db!.delete(_tableName, where: 'id=?', whereArgs: [task.id]);
  }

  static Future<int> deleteAll() async {
    return await _db!.delete(_tableName);
  }

  static Future<List<Map<String, dynamic>>> quere() async {
    return await _db!.query(_tableName);
  }

  static Future<int> update(int id) async {
    return await _db!.rawUpdate('''
UPDATE tasks 
SET isCompleted =?
WHERE id=? 
''', [1, id]);
  }
}
