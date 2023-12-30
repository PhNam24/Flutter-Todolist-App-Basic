import 'package:todolist_1/src/models/task.dart';

class TodoService {
  Future<List<Task>> getTodoList() async {
    return [
      Task.fromData(1, "content1"),
      Task.fromData(2, "content2"),
    ];
  }
}