import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(20.0),
              child: Text(
                  'Lista de Tarefas - V 1.0.0\nData de Criação: 19/11/2023')),
          const Padding(
              padding: EdgeInsets.all(20.0),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Image(
                          image: AssetImage('assets/julio.png'), height: 300.0),
                      Text(
                        'Júlio César Vieira Santos',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Estudante de Sistemas de Informação',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                  'Lista de Tarefas é um aplicativo para fazer o controle de suas tarefas, com a possibilidade de cadastrar,'
                  ' editar, excluir, e marcar se já foram executadas.\n\nO aplicativo possui persistência de dados em um banco de dados local.')),
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
