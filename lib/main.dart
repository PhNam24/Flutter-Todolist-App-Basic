import 'package:flutter/material.dart';
import 'package:todolist_1/src/app.dart';
import 'package:todolist_1/src/db/todo_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TodoDatabase.instance.init();
  runApp(MyApp());
}
