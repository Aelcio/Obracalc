import 'package:flutter/material.dart';
import 'package:obracalc/generic/botaomenu.dart';
import 'package:obracalc/view/cadmateriais.dart';

class menuClientes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe0e0e0),
      appBar: AppBar(
        title: Text("Clientes"),
      ),
        body: Container(
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Expanded(child:
                btnGenericoMenu("Cadastrar", '/cadClientes', Icons.add),
                ),
                Expanded(child:
                btnGenericoMenu('Pesquisar', '/consultaClientes', Icons.search),
                ),
              ],
            ),
          ),
        ),
     );
  }
}
