import 'package:flutter/material.dart';
import 'package:lista_contatos/components/contato_dialog.dart';
import 'package:lista_contatos/model/contato.dart';

class ListaContatos extends StatefulWidget {
  const ListaContatos({super.key});

  @override
  State<ListaContatos> createState() => _ListaContatosState();
}

class _ListaContatosState extends State<ListaContatos> {
  List<Contato> listaContatos = [];

  @override
  Widget build(BuildContext context) {
    void adicionarContato(Contato contato) {
      setState(() {
        listaContatos.add(contato);
      });
    }

    void editarContato(int? index, Contato contato) {
      setState(() {
        if (index != null) {
          listaContatos[index] = contato;
        }
      });
    }

    void excluirContato(int index) {
      setState(() {
        listaContatos.removeAt(index);
      });
    }

    void excluirTodosContatos() {
      setState(() {
        listaContatos.clear();
      });
    }

    void showExcluirTodosDialog() {
      showDialog(context: context, builder: (_) {
        return AlertDialog(
          content: Container(
            height: 410,
            width: 400,
            child: Text('Deseja excluir todos os contatos?'),
          ),
        );
      });
    }

    void showAdicionarContatosDialog() {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: AdicionarContatoDialog(adicionarContato, editarContato),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
      );
    }

    void showEditarContatoDialog(int index, Contato contatoEdicao) {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: AdicionarContatoDialog(
                adicionarContato, editarContato, contatoEdicao, index),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
      );
    }

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: showAdicionarContatosDialog,
          backgroundColor: const Color.fromRGBO(41, 86, 155, 1),
          focusColor: const Color.fromRGBO(202, 202, 202, 1),
          foregroundColor: const Color.fromRGBO(202, 202, 202, 1),
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(41, 86, 155, 1),
          title: const Text(
            'Lista de contatos',
            style: TextStyle(
                fontSize: 20, color: Color.fromRGBO(246, 246, 246, 1.0)),
          ),
          leading: const Icon(
            Icons.menu,
            color: Color.fromRGBO(246, 246, 246, 1.0),
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
                          leading: const Icon(
                            Icons.person,
                            size: 40.0,
                            color: Color.fromRGBO(41, 86, 155, 1),
                          ),
                          title: Text(
                            listaContatos[index].nome,
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          subtitle: Text(
                            listaContatos[index].numero +
                                '\n' +
                                listaContatos[index].email,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                color: Color.fromRGBO(56, 68, 85, 1)),
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: Color.fromRGBO(41, 86, 155, 1),
                                ),
                                onPressed: () {
                                  showEditarContatoDialog(
                                      index, listaContatos[index]);
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  excluirContato(index);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: listaContatos.length,
                ),
              ),
              Container(
                width: 285,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      excluirTodosContatos();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      padding: const EdgeInsets.all(20.0),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    child: const Text('Excluir todos os contatos'),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
