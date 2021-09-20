import 'package:flutter/material.dart';
import 'package:obracalc/generic/campos.dart';

class consultaMateriais extends StatelessWidget {
  final TextEditingController _buscaCliente = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consulta Materiais')),
      body: ListView(
        children: [
          Editor(_buscaCliente, '', 'Localizar Material', Icons.search),
        ],
      ),
    );
  }
}
