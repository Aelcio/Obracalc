import 'package:flutter/material.dart';
import 'package:obracalc/generic/app_bar_customizada.dart';
import 'package:obracalc/generic/campos.dart';

class consultaOrcamentos extends StatelessWidget {
  final TextEditingController _buscaCliente = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomizada(titulo: 'Consulta Orçamentos',),
      body: ListView(
        children: [
          Editor(_buscaCliente, '', 'Localizar Orçamento', Icons.search, TextInputType.text, TextCapitalization.words),
        ],
      ),
    );
  }
}
