import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'task.dart';
import 'tasklist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // UI
        brightness: Brightness.light,
        primaryColor: Colors.white,

        // font
        fontFamily: 'Inter',
        //text style
        textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
            subtitle2: TextStyle(fontSize: 18.0, fontFamily: 'Inter', fontWeight: FontWeight.w500, color: Color(0xFF242426))
        ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFF242426)),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => Tasks(),
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              width: 269,
              child: TodoList(context.watch<Tasks>().tasks),
            ),
          )
        ],
      ),
    );
  }
}

