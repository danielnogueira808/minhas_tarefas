import 'package:flutter/material.dart';
import 'package:minhas_tarefas/widgets/formulario.dart';
import 'package:minhas_tarefas/widgets/lista.dart';

void main() {
  runApp(MinhasTarefas());
}

class MinhasTarefas extends StatefulWidget {
  @override
  _MinhasTarefasState createState() => _MinhasTarefasState();
}

class _MinhasTarefasState extends State<MinhasTarefas> {
  List<Map<String, dynamic>> _tarefas = [];

  void _limparTarefas() {
    setState(() {
      _tarefas.clear();
    });
  }

  void _adicionarTarefa(texto) {
    setState(() {
      _tarefas.add({"texto": texto, "realizada": false});
    });
  }

  void _removerTarefa(index) {
    setState(() {
      _tarefas.removeAt(index);
    });
  }

  void _alterarEstadoTarefa(index) {
    setState(() {
      _tarefas[index]["realizada"] = !_tarefas[index]["realizada"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.deepPurple,
          buttonColor: Colors.deepPurpleAccent),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Minhas Tarefas"),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _limparTarefas,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Formulario(_adicionarTarefa),
              Lista(_tarefas, _removerTarefa, _alterarEstadoTarefa)
            ],
          ),
        ),
      ),
    );
  }
}
