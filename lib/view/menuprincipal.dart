import 'package:flutter/material.dart';
import 'package:obracalc/generic/botaomenu.dart';
import 'package:obracalc/view/cadclientes.dart';
import 'package:obracalc/view/menutracos.dart';

class menuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf5f5f5),
      appBar: AppBar(
        title: Text("Menu Principal"),
      ),
      body: ListView(
        //children: [
         // Expanded(
              //child: Padding(
            //padding: const EdgeInsets.all(8.0),
           // child: Container(
              // color: Colors.orange,
              //child: Padding(
                //padding: const EdgeInsets.all(8.0),
                //child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: btnGenericoMenu("Clientes",'/menuClientes', Icons.person_outline_rounded),
                    ),
                    btnGenericoMenu('Orçamento', '/menuOrcamento', Icons.attach_money_rounded),
                    btnGenericoMenu('Serviços','/menuServicos', Icons.construction_rounded),
                    btnGenericoMenu('Unidade de Medida','/menuUndMedidas', Icons.construction_rounded),
                    btnGenericoMenu('Materiais','/menuMateriais', Icons.house_outlined),
                    btnGenericoMenu("Traços", '/menuTraco',Icons.construction_rounded),
                    btnGenericoMenu("Usuários", '/menuUsuarios', Icons.person),
                    ],
                ),
              );
           // ),
          //)),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              //color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    //btnGenericoMenu('Materiais','/menuMateriais'),
                    //btnGenericoMenu("Traços", '/menuTraco'),
                    //btnGenericoMenu("Usuários", '/menuUsuarios'),
                  ],
                ),
              ),
            ),
         // ))
        //],
      ),
    );
  }
}
