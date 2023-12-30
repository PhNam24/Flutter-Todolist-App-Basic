import 'package:todolist_1/src/base/base_event.dart';

class AddTaskEvent extends BaseEvent {
  late String _content;

  AddTaskEvent(String content) {
    _content = content;
  }

  String get content => _content;
}
