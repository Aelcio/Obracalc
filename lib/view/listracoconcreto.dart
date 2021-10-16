import 'package:flutter/material.dart';

class listaTracoConcreto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Traços para Concreto")),
      body: criaTabela(),
    );
  }
  criaTabela() {
    return Table(
      defaultColumnWidth: FixedColumnWidth(205.0),
      border: TableBorder(
        horizontalInside: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        verticalInside: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 1.0,
        ),
      ),
      children: [
        _criarLinhaTable("TIPO DE OBRA,CIMENTO:AREIA:BRITA"),
        _criarLinhaTable("Chapisco em teto ou superfície de concreto,"),
        _criarLinhaTable("Chapisco em Parede de tijolo ou bloco,"),
        _criarLinhaTable("Emboço Interno                  ,"),
        _criarLinhaTable("Emboço Externo ou Emboço de base para cerâmica,"),
        _criarLinhaTable("Alveraria (não estrutural),"),
        _criarLinhaTable("Contrapiso de Base para CerâmicA,"),
        _criarLinhaTable("Contrapiso de base para tacos ou piso de cimento,"),
        // _criarLinhaTable(" , ,"),

      ],
    );
  }
  _criarLinhaTable(String listaNomes) {
    return TableRow(
      children: listaNomes.split(',').map((name) {
        return Container(
          alignment: Alignment.center,
          child: Text(
            name,
            style: TextStyle(fontSize: 11.0),
          ),
          padding: EdgeInsets.all(8.0),
        );
      }).toList(),
    );
  }
}
