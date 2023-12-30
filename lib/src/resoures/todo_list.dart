import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_1/src/bloc/todo_bloc.dart';
import 'package:todolist_1/src/events/delete_task_event.dart';
import 'package:todolist_1/src/models/task.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var bloc = Provider.of<TodoBloc>(context);
    bloc.initData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoBloc>(
      builder: (context, bloc, child) => StreamBuilder<List<Task>>(
        stream: bloc.todoBlocStream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              print("1");
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(snapshot.data![index].content),
                      trailing: GestureDetector(
                        onTap: () {
                          bloc.event
                              .add(DeleteTaskEvent(snapshot.data![index]));
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    );
                  },
                ),
              );
            case ConnectionState.waiting:
              print("2");
              return const Expanded(
                child: Center(
                  child: Text("There is no task, please add your tasks!"),
                ),
              );
            case ConnectionState.none:
            default:
              print("3");
              return const Expanded(
                child: Center(
                  child: SizedBox(
                    height: 75,
                    width: 75,
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
