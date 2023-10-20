import 'package:flutter/material.dart';
import 'package:lista_contatos/model/contato.dart';
import 'package:masked_text/masked_text.dart';

class AdicionarContatoDialog extends StatefulWidget {
  final Function(Contato) adicionarContato;
  final Function(int?, Contato) editarContato;
  final Contato? contatoEdicao;
  final int? indexContatoEdicao;

  const AdicionarContatoDialog(this.adicionarContato, this.editarContato,
      [this.contatoEdicao, this.indexContatoEdicao]);

  @override
  State<AdicionarContatoDialog> createState() => _AdicionarContatoDialogState();
}

class _AdicionarContatoDialogState extends State<AdicionarContatoDialog> {
  @override
  Widget build(BuildContext context) {
    Widget buildTextField(String hint, TextEditingController controller,
        {String? mask}) {
      return Container(
        margin: const EdgeInsets.all(4),
        child: MaskedTextField(
          mask: mask,
          decoration: InputDecoration(
            labelText: hint,
            labelStyle: const TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(56, 68, 85, 1),
              fontWeight: FontWeight.w400,
            ),
            hintText: 'Digite seu ${hint}',
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
    var numeroController = TextEditingController();
    var cpfController = TextEditingController();
    var emailController = TextEditingController();

    if (widget.contatoEdicao != null) {
      final contato = widget.contatoEdicao!;
      nomeController.text = contato.nome;
      numeroController.text = contato.numero;
      cpfController.text = contato.CPF;
      emailController.text = contato.email;
    }

    adicionar() {
      if (nomeController.text.isNotEmpty && numeroController.text.isNotEmpty) {
        setState(() {
          final nome = nomeController.text;
          final numero = numeroController.text;
          final cpf = cpfController.text;
          final email = emailController.text;
          final contato = Contato(nome, numero, cpf, email);
          if (widget.contatoEdicao != null &&
              widget.indexContatoEdicao != null) {
            widget.editarContato(widget.indexContatoEdicao, contato);
            return;
          }
          widget.adicionarContato(contato);
        });
        Navigator.of(context).pop();
      }
    }

    return Container(
        padding: const EdgeInsets.all(8),
        height: 410,
        width: 400,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Adicionar Contato',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Color.fromRGBO(41, 86, 155, 1),
                ),
              ),
              buildTextField('Nome', nomeController),
              buildTextField('Número', numeroController,
                  mask: "(##)#####-####"),
              buildTextField('CPF', cpfController, mask: "###.###.###-##"),
              buildTextField('Email', emailController),
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
