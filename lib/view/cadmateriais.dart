import 'package:flutter/material.dart';
import 'package:obracalc/controller/materialControle.dart';
import 'package:obracalc/generic/campos.dart';
import 'package:obracalc/models/materialModelo.dart';

class cadMateriais extends StatelessWidget {
  final TextEditingController _descricao = TextEditingController();
  final TextEditingController _unidadeMedida = TextEditingController();
  final TextEditingController _valorUnitario = TextEditingController();
  final MaterialControle _control = MaterialControle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf5f5f5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Cadastro de Materiais",
          style: TextStyle(color: Colors.black45),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Editor(_descricao, 'Descricao', 'Descricao', Icons.water,
                TextInputType.text, TextCapitalization.words),
            Editor(_unidadeMedida, 'Unidade de Medida', 'Unidade de Medida',
                Icons.water, TextInputType.text, TextCapitalization.words),
            Editor(_valorUnitario, 'Valor Unitário', 'Valor Unitário',
                Icons.water, TextInputType.number, TextCapitalization.words),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  child: Text(
                    "Salvar",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    final String descricao = _descricao.text;
                    final int undMedida = int.parse(_unidadeMedida.text);
                    final double valor = double.parse(_valorUnitario.text);
                    final MaterialModelo newMaterial =
                        MaterialModelo(0, descricao, undMedida, valor);
                    _control
                        .save(newMaterial)
                        .then((idMaterial) => Navigator.pop(context));
                  },
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 12.0),
                      textStyle: TextStyle(
                        fontSize: 18,
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
