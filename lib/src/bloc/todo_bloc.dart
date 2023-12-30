import 'dart:async';

import 'package:todolist_1/src/base/base_bloc.dart';
import 'package:todolist_1/src/base/base_event.dart';
import 'package:todolist_1/src/db/todo_table.dart';
import 'package:todolist_1/src/events/add_task_event.dart';
import 'package:todolist_1/src/events/delete_task_event.dart';
import 'package:todolist_1/src/models/task.dart';

class TodoBloc extends BaseBloc {
  int _taskIndex = 1;
  final _todoListStreamController = StreamController<List<Task>>();
  TodoTable _todoTable = TodoTable();
  List<Task> _todoListData = [];

  Stream<List<Task>> get todoBlocStream => _todoListStreamController.stream;

  void initData() async {
    _todoListData  = await _todoTable.selectAllTask();
    if (_todoListData == null) {
      return;
    }
    _todoListStreamController.sink.add(_todoListData); 
  }

  void _addTodo(Task task) async {
    //insert to db
    await _todoTable.insertTask(task);

    _todoListData.add(task);
    _todoListStreamController.sink.add(_todoListData);
  }

  void _deleteTodo(Task task) async {
    await _todoTable.deleteTask(task);

    _todoListData.remove(task);
    _todoListStreamController.sink.add(_todoListData);
  }

  @override
  void dispatchEvent(BaseEvent event) {
    if (event is AddTaskEvent) {
      Task task = Task.fromData(_taskIndex++, event.content);
      _addTodo(task);
    } else if (event is DeleteTaskEvent) {
      _deleteTodo(event.task);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _todoListStreamController.close();
  }
}
