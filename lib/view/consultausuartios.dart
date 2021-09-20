import 'package:flutter/material.dart';
import 'package:obracalc/generic/campos.dart';

class consultaUsuarios extends StatelessWidget {
  final TextEditingController _buscaCliente = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consulta Usuarios')),
      body: ListView(
        children: [
          Editor(_buscaCliente, '', 'Localizar Usuario', Icons.search),
        ],
      ),
    );
  }
}
