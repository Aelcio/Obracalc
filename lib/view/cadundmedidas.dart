import 'package:flutter/material.dart';
import 'package:obracalc/generic/campos.dart';

class cadUndMedida extends StatelessWidget {
  final TextEditingController _descricao = TextEditingController();
  final TextEditingController _descricaoReduzida = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Unidade de Medida"),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Editor(_descricao, 'Descrição', 'Descriçao', Icons.water),
          Editor(_descricaoReduzida, 'DescriçãoReduzida', 'Descriçao Reduzida', Icons.water),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                child: Text(
                  "Salvar",
                ),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding:
                    EdgeInsets.symmetric(horizontal: 50, vertical: 12.0),
                    textStyle: TextStyle(
                      fontSize: 18,
                    ))),
          )
        ],
      ),
    );
  }
}
