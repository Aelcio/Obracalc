import 'package:flutter/material.dart';
import 'package:obracalc/generic/botaomenu.dart';
import 'package:obracalc/view/cadclientes.dart';
import 'package:obracalc/view/menutracos.dart';

class menuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe0e0e0),
      appBar: AppBar(
        title: Text("Menu Principal"),
      ),
      body: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // color: Colors.orange,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    btnGenericoMenu("Clientes",'/menuClientes'),
                    btnGenericoMenu('Orçamento', '/menuOrcamento'),
                    btnGenericoMenu('Serviços','/menuServicos'),
                    btnGenericoMenu('Unidade','/menuUndMedidas'),
                    ],
                ),
              ),
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              //color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    btnGenericoMenu('Materiais','/menuMateriais'),
                    btnGenericoMenu("Traços", '/menuTraco'),
                    btnGenericoMenu("Usuários", '/menuUsuarios'),
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
