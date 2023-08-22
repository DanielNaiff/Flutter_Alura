import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencias(),
      ),
    );
  }
}

class FormulaTransferencia extends StatefulWidget {
  FormulaTransferencia({super.key});

  @override
  State<FormulaTransferencia> createState() => FormulaTransferenciaState();
}

class FormulaTransferenciaState extends State<FormulaTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controlador: _controladorCampoNumeroConta,
              dica: '0000',
              rotulo: 'Número da conta',
            ),
            Editor(
              controlador: _controladorCampoValor,
              dica: '0.00',
              rotulo: 'Valor',
              icone: Icons.monetization_on,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  _criaTransferencia(context);
                },
                child: Text('Confirmar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final tranferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, tranferenciaCriada);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTransferencias extends StatefulWidget {
//Essa variável foi criada para o itemcount
  final List<Transferencia> _transferencias = [];

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
      appBar: AppBar(
        title: const Text('Tranferências'),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final Transferencia = widget._transferencias[indice];
          return ItemTransferencia(Transferencia);
        },
        //O listview será usado aqui, pois é a melhor opção quando não sabemos a quantidade exata de itens da lista
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transferencia> future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormulaTransferencia();
              },
            ),
          ) as Future<Transferencia>;

          future.then((transferenciaRecebida) {
            Future.delayed(Duration(seconds: 1), () {
              setState(() {
                widget._transferencias.add(transferenciaRecebida);
              });
            });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor,numeroConta: $numeroConta}';
  }
}
