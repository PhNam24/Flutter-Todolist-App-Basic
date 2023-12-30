import 'package:todolist_1/src/base/base_event.dart';
import 'package:todolist_1/src/models/task.dart';

class DeleteTaskEvent extends BaseEvent {
  late Task _task;

  DeleteTaskEvent(this._task);

  Task get task => _task;
}
