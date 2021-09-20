import 'package:flutter/material.dart';
import 'package:obracalc/generic/campos.dart';

class consultaServicos extends StatelessWidget {
  final TextEditingController _buscaCliente = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consulta Serviços')),
      body: ListView(
        children: [
          Editor(_buscaCliente, '', 'Localizar Serviço', Icons.search),
        ],
      ),
    );
  }
}
