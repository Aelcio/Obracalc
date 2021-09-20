import 'package:flutter/material.dart';
import 'package:obracalc/generic/botaomenu.dart';
import 'package:obracalc/view/cardmateriais.dart';

class menuOrcamento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe0e0e0),
      appBar: AppBar(
        title: Text("Orçamento")
      ),
      body: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Column(
                children: [
                  btnGenericoMenu("Cadastrar", '/orcamento'),
                ],
              ),
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Column(
                children: [
                  btnGenericoMenu("Pesquisar",'/consultaOrcamento'),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
