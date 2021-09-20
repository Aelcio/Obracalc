import 'package:flutter/material.dart';
import 'package:obracalc/generic/campos.dart';

class consultaClientes extends StatelessWidget {
  final TextEditingController _buscaCliente = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consulta Clientes')),
      body: ListView(
        children: [
          Editor(_buscaCliente, '', 'Localizar Cliente', Icons.search),
        ],
      ),
    );
  }
}
