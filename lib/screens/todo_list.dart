import 'package:flutter/material.dart';
import '../components/contato_dialog.dart';
import '../database/database_helper.dart';
import '../model/todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> todoList = [];
  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    void adicionarContato(Todo todo) async {
      await dbHelper.insert(todo);
      var todos = await dbHelper.getAllNotes();
      setState(() {
        todoList = todos;
      });
    }

    void editarContato(Todo todo) async {
      await dbHelper.update(todo);
      var todos = await dbHelper.getAllNotes();
      setState(() {
        todoList = todos;
      });
    }

    void checkItem(Todo todo) {
      todo.done == 1 ? todo.done = 0 : todo.done = 1;
      editarContato(todo);
    }

    void excluirContato(int? id) async {
      if (id != null) {
        await dbHelper.delete(id);
        var todos = await dbHelper.getAllNotes();
        setState(() {
          todoList = todos;
        });
      }
    }

    void excluirTodosContatos() async {
      for (int i = 0; i < todoList.length; i++) {
        if (todoList[i] != null) {
          var id = todoList[i].id;
          if (id != null) {
            await dbHelper.delete(id);
          }
        }
      }
      setState(() {
        todoList.clear();
        Navigator.of(context).pop();
      });
    }

    void showExcluirTodosDialog() {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
                content: Container(
                    padding: const EdgeInsets.all(8),
                    height: 115,
                    width: 400,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Text(
                            'Deseja excluir todas as tarefas?',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Color.fromRGBO(41, 86, 155, 1),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ElevatedButton(
                                    onPressed: excluirTodosContatos,
                                    style: ElevatedButton.styleFrom(
                                        primary: const Color.fromRGBO(
                                            41, 86, 155, 1),
                                        onPrimary: const Color.fromRGBO(
                                            202, 202, 202, 1),
                                        padding: const EdgeInsets.all(5.0),
                                        textStyle: const TextStyle(
                                          fontSize: 14,
                                          color: Color.fromRGBO(56, 68, 85, 1),
                                        )),
                                    child: const Text('Confirmar')),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ElevatedButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    style: ElevatedButton.styleFrom(
                                        onPrimary: const Color.fromRGBO(
                                            41, 86, 155, 1),
                                        primary: const Color.fromRGBO(
                                            202, 202, 202, 1),
                                        padding: const EdgeInsets.all(5.0),
                                        textStyle: const TextStyle(
                                          fontSize: 14,
                                          color: Color.fromRGBO(56, 68, 85, 1),
                                        )),
                                    child: const Text('Cancelar')),
                              ),
                            ],
                          )
                        ],
                      ),
                    )));
          });
    }

    void showAdicionarContatosDialog() {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: AdicionarTarefaDialog(adicionarContato, editarContato),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
      );
    }

    void showEditarContatoDialog(Todo tarefaEdicao) {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: AdicionarTarefaDialog(
                adicionarContato, editarContato, tarefaEdicao),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
      );
    }

    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(41, 86, 155, 1),
                ),
                margin: EdgeInsets.all(0),
                child: Text(
                  'Lista de tarefas',
                  style: TextStyle(
                      fontSize: 20, color: Color.fromRGBO(246, 246, 246, 1.0)),
                ),
              ),
              ListTile(
                title: const Text('Lista de tarefas'),
                onTap: () {
                  onPressed:
                  () => Navigator.pushNamed(context, '/todo-list');
                },
              ),
              ListTile(
                title: const Text('Sobre'),
                onTap: () {
                  Navigator.pushNamed(context, '/about');
                },
              ),
              ListTile(
                  title: const Text('Ajuda'),
                  onTap: () {
                    Navigator.pushNamed(context, '/help');
                  }),
            ],
          ),
        ),
        floatingActionButton: Tooltip(
          message: 'Adicionar',
          textAlign: TextAlign.center,
          child: FloatingActionButton(
            onPressed: showAdicionarContatosDialog,
            backgroundColor: const Color.fromRGBO(41, 86, 155, 1),
            focusColor: const Color.fromRGBO(202, 202, 202, 1),
            foregroundColor: const Color.fromRGBO(202, 202, 202, 1),
            child: const Icon(Icons.add),
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(41, 86, 155, 1),
          title: const Text(
            'Lista de tarefas',
            style: TextStyle(
                fontSize: 20, color: Color.fromRGBO(246, 246, 246, 1.0)),
          ),
        ),
        backgroundColor: Colors.grey[200],
        body: Container(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(15),
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: ListTile(
                          leading: IconButton(
                              icon: Icon(
                                todoList[index].done == 1
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                                size: 40.0,
                                color: todoList[index].done == 1
                                    ? Colors.green
                                    : const Color.fromRGBO(41, 86, 155, 1),
                              ),
                              onPressed: () {
                                checkItem(todoList[index]);
                              }),
                          title: Text(
                            todoList[index].name,
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  color: Color.fromRGBO(41, 86, 155, 1),
                                ),
                                onPressed: () {
                                  showEditarContatoDialog(todoList[index]);
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  excluirContato(todoList[index].id);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: todoList.length,
                ),
              ),
              Container(
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      showExcluirTodosDialog();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      padding: const EdgeInsets.all(10.0),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    child: const Text('Excluir todas as tarefas'),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
