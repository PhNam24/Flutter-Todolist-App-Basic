import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_1/src/bloc/todo_bloc.dart';
import 'package:todolist_1/src/events/add_task_event.dart';

class TodoHeader extends StatelessWidget {
  TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var inputController = TextEditingController();
    var todoBloc = Provider.of<TodoBloc>(context);
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            controller: inputController,
            decoration: const InputDecoration(
              labelText: "Add Your Task",
              hintText: "Add Your Tasks",
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () => {
            todoBloc.event.add(AddTaskEvent(inputController.text)),
          },
          child: const Row(
            children: <Widget>[
              Icon(Icons.add),
              Text("Add"),
            ],
          ),
        )
      ],
    );
  }
}
