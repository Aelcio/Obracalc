import 'package:flutter/material.dart';
import 'package:obracalc/controller/undmedidaControle.dart';
import 'package:obracalc/generic/campos.dart';
import 'package:obracalc/models/undmedidaModelo.dart';

class cadUndMedida extends StatelessWidget {
  final TextEditingController _descricao = TextEditingController();
  final TextEditingController _descricaoReduzida = TextEditingController();
  final UndMedidaControle control = UndMedidaControle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Unidade de Medida"),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Editor(_descricao, 'Descrição', 'Descriçao', Icons.water, TextInputType.text, TextCapitalization.words),
          Editor(_descricaoReduzida, 'DescriçãoReduzida', 'Descriçao Reduzida', Icons.water, TextInputType.text, TextCapitalization.words),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                child: Text(
                  "Salvar",
                ),
                onPressed: () {
                  final String descricao = _descricao.text;
                  final String descreduzida = _descricaoReduzida.text;
                  final UnidadeMedida newMedida = UnidadeMedida(0, descricao, descreduzida);
                  control.save(newMedida).then((idServico)=> Navigator.pop(context));
                },
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
