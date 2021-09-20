import 'package:flutter/material.dart';
import 'package:obracalc/generic/campos.dart';

class pesquisaMateriais extends StatelessWidget {
  final TextEditingController _descricao = TextEditingController();
  final TextEditingController _unidadeMedida = TextEditingController();
  final TextEditingController _valorUnitario = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consulta Materiais"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Editor(_descricao, 'Descricao', 'Descricao', Icons.water),
          Editor(_unidadeMedida, 'Unidade de Medida', 'Unidade de Medida', Icons.search),
          Editor(_valorUnitario, 'Valor Unitário', 'Valor Unitário', Icons.water),
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
