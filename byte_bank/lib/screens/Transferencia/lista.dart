import 'package:byte_bank/main.dart';
import 'package:byte_bank/models/transferencia.dart';
import 'package:byte_bank/screens/Transferencia/fomulario.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = "Transferências";

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia?> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_tituloAppBar)),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (BuildContext context, int index) {
          final transferencia = widget._transferencias[index];
          return ItemTransferencia(transferencia!);
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            final Future<Transferencia?> future = Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return FormularioTransferencia();
                },
              ),
            );
            future.then((transferenciaRecebida) {
              _atualiza(transferenciaRecebida);
            });
          },
          child: const Icon(Icons.add)),
    );
  }

  void _atualiza(Transferencia? transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() {
        widget._transferencias.add(transferenciaRecebida);
      });
    }
  }
}
