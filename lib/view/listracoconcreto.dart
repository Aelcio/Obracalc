import 'package:flutter/material.dart';
import 'package:obracalc/generic/app_bar_customizada.dart';

class listaTracoConcreto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomizada(titulo: "Traços para Concreto"),
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
        _criarLinhaTable("Bloco de Funcdação, 1 : 2.5 : 4 "),
        _criarLinhaTable("Baldrame, 1 : 2 : 3 ou 1 : 2.5 : 3.5"),
        _criarLinhaTable("Pilares(Colunas), 1 : 2 : 3 ou 1 : 2.5 : 3.5"),
        _criarLinhaTable("Vigas Médias, 1 : 2 : 3 ou 1 : 2.5 : 3.5"),
        _criarLinhaTable("Cinta, 1 : 2 : 3 ou 1 : 2.5 : 3.5"),
        _criarLinhaTable("Laje, 1 : 2 : 3 ou 1 : 2.5 : 3.5"),
        _criarLinhaTable("Piso com trafego de veiculos leves ou pessoas, 1: 2.5 : 3.5"),
        _criarLinhaTable("Piso de Concreto Magro, 1 : 4 : 6"),
        // _criarLinhaTable(" , ,"),

      ],
    );
  }
  _criarLinhaTable(String listaNomes) {
    return TableRow(
      children: listaNomes.split(',').map((name) {
        return Container(
          alignment: Alignment.centerLeft,
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
