import 'package:flutter/material.dart';

class Lista extends StatelessWidget {
  final List<Map<String, dynamic>> _tarefas;
  final Function _removerTarefa;
  final Function _alterarEstadoTarefa;

  Lista(this._tarefas, this._removerTarefa, this._alterarEstadoTarefa);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: _tarefas.length,
          itemBuilder: (context, index) {
            final texto = _tarefas[index]["texto"];
            final realizada = _tarefas[index]["realizada"];
            return ListTile(
              title: Text(
                texto,
                style: TextStyle(
                    decoration: realizada
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              selected: !realizada,
              onLongPress: () => _removerTarefa(index),
              onTap: () => _alterarEstadoTarefa(index),
            );
          }),
    );
  }
}
