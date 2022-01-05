import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:obracalc/generic/app_bar_customizada.dart';
import 'package:path/path.dart';

class listaTracoArgamassa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomizada(titulo: "Traços para Argamassa"),

      body: criaTabela(),
    );
  }
  criaTabela() {
    return Table(
      defaultColumnWidth: FixedColumnWidth(144.0),
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
        _criarLinhaTable("TIPO DE OBRA,CIMENTO:AREIA:BRITA, CIMENTO:AREIA"),
        _criarLinhaTable("Chapisco em teto ou superfície de concreto, - ,1 : 3"),
        _criarLinhaTable("Chapisco em Parede de tijolo ou bloco, - ,1 : 4"),
        _criarLinhaTable("Emboço Interno                  ,1 : 2 : 9,1 : 7 + Aditivo"),
        _criarLinhaTable("Emboço Externo ou Emboço de base para cerâmica,1 : 1 : 6 ,1 : 5"),
        _criarLinhaTable("Alveraria (não estrutural) ,1 : 0.5 : 6 ou 1 : 2 : 9,1 : 6 + Aditivo "),
        _criarLinhaTable("Contrapiso de Base para Cerâmica , - ,1 : 5"),
        _criarLinhaTable("Contrapiso de base para tacos ou piso de cimento queimado , - ,1: 4"),
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

