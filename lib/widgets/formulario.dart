import 'package:flutter/material.dart';

class Formulario extends StatelessWidget {
  final Function _adicionarTarefa;

  Formulario(this._adicionarTarefa);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _inputController = TextEditingController();

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: "Nova Tarefa"),
            controller: _inputController,
            validator: (value) =>
                value.isEmpty ? "Campo deve ser preenchido" : null,
          ),
          RaisedButton(
            child: Text(
              "Adicionar",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              if (_formKey.currentState.validate())
                _adicionarTarefa(_inputController.text);
            },
          )
        ],
      ),
    );
  }
}
