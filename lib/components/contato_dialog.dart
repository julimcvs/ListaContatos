import 'package:flutter/material.dart';
import 'package:masked_text/masked_text.dart';

import '../model/todo.dart';

class AdicionarTarefaDialog extends StatefulWidget {
  final Function(Todo) adicionarTarefa;
  final Function(Todo) editarTarefa;
  final Todo? tarefaEdicao;
  final int? indexTarefaEdicao;

  const AdicionarTarefaDialog(this.adicionarTarefa, this.editarTarefa,
      [this.tarefaEdicao, this.indexTarefaEdicao]);

  @override
  State<AdicionarTarefaDialog> createState() => _AdicionarTarefaDialogState();
}

class _AdicionarTarefaDialogState extends State<AdicionarTarefaDialog> {
  @override
  Widget build(BuildContext context) {
    Widget buildTextField(String hint, TextEditingController controller,
        {String? mask}) {
      return Container(
        margin: const EdgeInsets.all(10),
        child: MaskedTextField(
          mask: mask,
          decoration: InputDecoration(
            labelText: hint,
            labelStyle: const TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(56, 68, 85, 1),
              fontWeight: FontWeight.w400,
            ),
            hintText: 'Digite o ${hint.toLowerCase()} da tarefa',
            hintStyle: const TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(32, 32, 32, 1),
              fontWeight: FontWeight.w400,
            ),
            alignLabelWithHint: true,
            contentPadding: const EdgeInsets.all(25.0),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.0),
                borderSide: const BorderSide(
                    width: 2, color: Color.fromRGBO(41, 86, 155, 1))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.0),
                borderSide: const BorderSide(
                    width: 2, color: Color.fromRGBO(202, 202, 202, 1))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.0),
                borderSide: const BorderSide(
                    width: 2, color: Color.fromRGBO(202, 202, 202, 1))),
          ),
          controller: controller,
        ),
      );
    }

    var nomeController = TextEditingController();
    var descricaoController = TextEditingController();

    if (widget.tarefaEdicao != null) {
      final todo = widget.tarefaEdicao!;
      nomeController.text = todo.name;
      descricaoController.text = todo.description;
    }

    adicionar() {
      if (nomeController.text.isNotEmpty) {
        setState(() {
          final nome = nomeController.text;
          final descricao = descricaoController.text;
          final todo = Todo(null, nome, descricao, 0);
          if (widget.tarefaEdicao != null) {
            todo.id = widget.tarefaEdicao?.id;
            todo.done = widget.tarefaEdicao?.done ?? 0;
            widget.editarTarefa(todo);
            return;
          }
          widget.adicionarTarefa(todo);
        });
        Navigator.of(context).pop();
      }
    }

    return Container(
        padding: const EdgeInsets.all(8),
        height: 300,
        width: 400,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Adicionar Tarefa',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Color.fromRGBO(41, 86, 155, 1),
                ),
              ),
              buildTextField('Nome', nomeController),
              buildTextField('Descrição', descricaoController),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                    onPressed: adicionar,
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(41, 86, 155, 1),
                        onPrimary: const Color.fromRGBO(202, 202, 202, 1),
                        padding: const EdgeInsets.all(20.0),
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(56, 68, 85, 1),
                        )),
                    child: const Text('Adicionar')),
              ),
            ],
          ),
        ));
  }
}
