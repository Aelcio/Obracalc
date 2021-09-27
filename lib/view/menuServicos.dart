import 'package:flutter/material.dart';
import 'package:obracalc/generic/botaomenu.dart';
import 'package:obracalc/view/cardmateriais.dart';

class menuServicos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFe0e0e0),
        appBar: AppBar(
          title: Text("Materiais"),
        ),
        body: Container(
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Expanded(
                  child:
                      btnGenericoMenu("Cadastrar", '/cadServicos', Icons.add),
                ),
                Expanded(
                  child: btnGenericoMenu(
                      "Pesquisar", '/consultaServicos', Icons.search),
                ),
              ],
            ),
          ),
        ));
  }
}
