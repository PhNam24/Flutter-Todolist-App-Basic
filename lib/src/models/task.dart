class Task {
  late int _id;
  late String _content;

  Task.fromData(id, content) {
    _id = id;
    _content = content;
  }

  int get id => _id;
  String get content => _content;

  set id(int id) {
    _id = id;
  }

  set content(String content) {
    _content = content;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'content': _content,
    };
  }
}
