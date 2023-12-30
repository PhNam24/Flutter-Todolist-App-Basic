import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todolist_1/src/base/base_event.dart';

abstract class BaseBloc {
  StreamController<BaseEvent> _eventController = StreamController<BaseEvent>();

  Sink<BaseEvent> get event => _eventController.sink;

  BaseBloc() {
    _eventController.stream.listen((event) {
      if (event is! BaseEvent) {
        throw Exception("Invalid Evennt");
      }

      dispatchEvent(event);
    });
  }

  void dispatchEvent(BaseEvent event) {}

  @mustCallSuper
  void dispose() {
    _eventController.close();
  }
}
