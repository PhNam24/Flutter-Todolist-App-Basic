

import 'package:todolist_1/src/db/todo_table.dart';
import 'package:todolist_1/src/models/task.dart';
import 'package:todolist_1/src/services/todo_service.dart';

class TodoRepo {
  TodoTable _todoTable = TodoTable();
  TodoService todoService = TodoService();

  Future<int> insertTodo(Task todo) {
    return _todoTable.insertTask(todo);
  }

  Future<void> deleteTodo(Task todo) async {
    return _todoTable.deleteTask(todo);
  }

  Future<List<Task>> selectAllTodo() async {
    return _todoTable.selectAllTask();
  }

  Future<List<Task>> initData() async {
    List<Task> data = List.empty();
    data = await _todoTable.selectAllTask();
    if (data.length == 0) {
      return await todoService.getTodoList();
    }
    return data;
  }
}