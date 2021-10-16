import 'package:flutter/material.dart';
import 'package:obracalc/generic/campos.dart';

class consultaUndMedida extends StatelessWidget {
  final TextEditingController _buscaCliente = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consulta Unid. Medida')),
      body: ListView(
        children: [
          Editor(_buscaCliente, '', 'Localizar Unidade de Medida', Icons.search, TextInputType.text, TextCapitalization.words),
        ],
      ),
    );
  }
}
