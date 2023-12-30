import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_1/src/bloc/todo_bloc.dart';
import 'package:todolist_1/src/resoures/todo_header.dart';
import 'package:todolist_1/src/resoures/todo_list_container.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Test 1",
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Todo List",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Provider<TodoBloc>.value(
          value: TodoBloc(),
          child: TodoListContainer(),
        ),
      ),
    );
  }
}
