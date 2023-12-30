import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todolist_1/src/db/todo_table.dart';

class TodoDatabase {
  static const DB_NAME = "todo.db";
  static const DB_VERSION = 1;
  static late Database _database;

  TodoDatabase._internal();
  static final TodoDatabase instance = TodoDatabase._internal();

  Database get database => _database;

  static const initScripts = [TodoTable.CREATE_TABLE_QUERY];
  static const migrationScripts = [TodoTable.CREATE_TABLE_QUERY];

  init() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), DB_NAME),
      onCreate: (db, version) {
        initScripts.forEach((script) async {
          return await db.execute(script);
        });
      },
      onUpgrade: (db, oldVersion, newVersion) {
        migrationScripts.forEach(
          (script) async {
            return await db.execute(script);
          },
        );
      },
      version: DB_VERSION,
    );
  }
}
