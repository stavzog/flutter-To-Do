import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'task.dart';

class CreateNew extends StatefulWidget {
  const CreateNew({Key? key}) : super(key: key);

  @override
  State<CreateNew> createState() => _CreateNewState();
}

class _CreateNewState extends State<CreateNew> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        height: 60,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                child: const Icon(Icons.add, color: Color(0xFF959BA2), size: 23),
                onTap: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    context.read<Tasks>().add(Task(_controller.text));
                    _controller.clear();
                  }
                },
              ),
              const SizedBox(width: 50),
              Expanded(
                child: TextFormField(
                  controller: _controller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                  style: Theme.of(context).textTheme.subtitle2,
                  decoration: InputDecoration(
                    border:  InputBorder.none,
                    hintText: 'Create new task',
                    hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: const Color(0xFF959BA2)),
                    errorStyle: const TextStyle(height: 0, color: Colors.transparent),
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

}
