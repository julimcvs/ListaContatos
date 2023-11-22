import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(20.0),
              child: Text('Lista de Tarefas - Ajuda')),
          const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                  '1. Para criar uma tarefa, basta clicar no botão "+" no canto inferior direito e preencher o nome e a descrição da tarefa.\n'
                  '2. Para editar uma tarefa, basta clicar no ícone azul de lápis e editar as informações que desejar.\n'
                  '3. Para excluir uma tarefa, basta clicar no ícone vermelho de lixeira.\n'
                  '4. Para marcar uma tarefa como Concluída, basta clicar na caixinha azul no lado esquerdo da tarefa.\n'
                  '5. Para excluir todas as tarefas, basta clicar no botão "Excluir todas as tarefas" no canto inferior da tela.')),
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(20.0),
            child: TextButton(
                onPressed: () => Navigator.pushNamed(context, '/todo-list'),
                style: ElevatedButton.styleFrom(
                    onPrimary: const Color.fromRGBO(41, 86, 155, 1),
                    primary: const Color.fromRGBO(202, 202, 202, 1),
                    padding: const EdgeInsets.all(10.0),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(56, 68, 85, 1),
                    )),
                child: const Text('Voltar')),
          ),
        ],
      ),
    );
  }
}
