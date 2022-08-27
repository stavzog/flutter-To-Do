import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'createnew.dart';
import 'task.dart';

class TodoList extends StatelessWidget {
  final List<Task> _tasks;
  const TodoList(this._tasks, {Key? key}): super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _tasks.length + 1,
      itemBuilder: (context, i) {
        if (i == _tasks.length) {
          return CreateNew();
        } else {
          return TodoItem(_tasks[i]);
        }
      },
    );
  }
}

class TodoItem extends StatelessWidget{
  final Task task;
  TodoItem(this.task, {Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: () => context.read<Tasks>().toggle(task),
        onDoubleTap: () => context.read<Tasks>().remove(task),
        child: SizedBox(
          height: 60,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.fiber_manual_record, color: Color(0xFF242426), size: 18),
                const SizedBox(width: 50),
                Text(
                  task.name,
                  style: task.style,
                )
              ]
          ),
        ),
      ),
    );
  }
}