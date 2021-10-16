import 'package:flutter/material.dart';
import 'package:obracalc/generic/campos.dart';

class pesquisaUndMedida extends StatelessWidget {
  final TextEditingController _descricao = TextEditingController();
  final TextEditingController _unidadeMedida = TextEditingController();
  final TextEditingController _valorUnitario = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consulta Unidade de Medida"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Editor(_descricao, 'Descricao', 'Descricao', Icons.water, TextInputType.text, TextCapitalization.words),
          Editor(_unidadeMedida, 'Unidade de Medida', 'Unidade de Medida', Icons.search, TextInputType.text, TextCapitalization.words),
          Editor(_valorUnitario, 'Valor Unitário', 'Valor Unitário', Icons.water, TextInputType.number, TextCapitalization.words),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                child: Text(
                  'Alterar',
                ),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 50, vertical: 12.0),
                    textStyle: TextStyle(
                      fontSize: 18,
                    ))),
          ),
        ],
      ),
    );
  }
}
