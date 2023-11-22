import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isHidden = true;

  void toggleHidden() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  IconData getPasswordIcon() {
    if (isHidden) {
      return Icons.visibility_off;
    } else {
      return Icons.visibility;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(41, 86, 155, 1),
        title: const Text(
          'Lista de tarefas',
          style: TextStyle(
              fontSize: 20, color: Color.fromRGBO(246, 246, 246, 1.0)),
        ),
        leading: const Icon(
          Icons.menu,
          color: Color.fromRGBO(246, 246, 246, 1.0),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: const TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(56, 68, 85, 1),
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: const Icon(Icons.person,
                    color: Color.fromRGBO(56, 68, 85, 1)),
                hintText: 'Digite seu nome de usuário',
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: const TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(56, 68, 85, 1),
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: const Icon(Icons.lock,
                    color: Color.fromRGBO(56, 68, 85, 1)),
                hintText: 'Digite sua senha',
                hintStyle: const TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(32, 32, 32, 1),
                  fontWeight: FontWeight.w400,
                ),
                suffixIcon: TextButton(
                  onPressed: toggleHidden,
                  child: Icon(getPasswordIcon(),
                      color: const Color.fromRGBO(56, 68, 85, 1)),
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
              keyboardType: TextInputType.text,
              style: const TextStyle(
                  fontSize: 20, color: Color.fromRGBO(56, 68, 85, 1)),
              obscureText: isHidden,
            ),
          ),
          ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/todo-list'),
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(41, 86, 155, 1),
                  onPrimary: const Color.fromRGBO(202, 202, 202, 1),
                  padding: const EdgeInsets.all(20.0),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(56, 68, 85, 1),
                  )),
              child: const Text('Login')),
        ],
      ),
    );
  }
}
