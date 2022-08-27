import 'package:flutter/material.dart';

class Tasks extends ChangeNotifier {
  final List<Task> _tasks = [
    Task('Get McDonalds', true),
    Task('Buy Milk'),
    Task('Get marry a present')
  ];

  List<Task> get tasks => _tasks;

  void add(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggle(Task task) {
    int i = _tasks.indexOf(task);
    _tasks[i].complete();
    notifyListeners();
  }

  void remove(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}

class Task {
  final String _name;
  bool _done;

  Task(this._name, [this._done = false]);

  String get name => _name;
  bool get done => _done;
  TextStyle get style {
    if (_done) {
      return const TextStyle(fontSize: 18.0, fontFamily: 'Inter', fontWeight: FontWeight.w600, color: Color(0xFF242426), decoration: TextDecoration.lineThrough);
    } else {
      return const TextStyle(fontSize: 18.0, fontFamily: 'Inter', fontWeight: FontWeight.w600, color: Color(0xFF242426));
    }
  }

  void complete() => _done = !_done;

}