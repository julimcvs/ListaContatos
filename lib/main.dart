import 'package:flutter/material.dart';
import 'package:lista_tarefas/screens/about.dart';
import 'package:lista_tarefas/screens/help.dart';
import 'package:lista_tarefas/screens/home.dart';
import 'package:lista_tarefas/screens/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/todo-list': (context) => const TodoList(),
        '/about': (context) => const AboutPage(),
        '/help': (context) => const HelpPage(),
      },
    );
  }
}
