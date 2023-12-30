import 'package:sqflite/sqflite.dart';
import 'package:todolist_1/src/db/todo_database.dart';
import 'package:todolist_1/src/models/task.dart';

class TodoTable {
  static const TABLE_NAME = "todo";
  static const CREATE_TABLE_QUERY = '''
    CREATE TABLE $TABLE_NAME (
      id INTEGER PRIMARY KEY,
      content TEXT
    );
  ''';
  static const DROP_TABLE_QUERY = '''
    DROP TABLE IF EXISTS  $TABLE_NAME
  ''';

  Future<int> insertTask(Task task) {
    final Database db = TodoDatabase.instance.database;
    return db.insert(
      TABLE_NAME,
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteTask(Task task) async {
    final Database db = TodoDatabase.instance.database;
    await db.delete(
      TABLE_NAME,
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<List<Task>> selectAllTask() async {
    final Database db = TodoDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME);
    return List.generate(maps.length, (index) {
      return Task.fromData(
        maps[index]['id'],
        maps[index]['content'],
      );
    });
  }
}
