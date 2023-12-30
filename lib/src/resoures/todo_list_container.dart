import 'package:flutter/material.dart';
import 'package:todolist_1/src/resoures/todo_header.dart';
import 'package:todolist_1/src/resoures/todo_list.dart';

class TodoListContainer extends StatefulWidget {
  const TodoListContainer({super.key});

  @override
  State<TodoListContainer> createState() => _TodoListContainerState();
}

class _TodoListContainerState extends State<TodoListContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          TodoHeader(),
          TodoList(),
        ],
      ),
    );
  }
}
