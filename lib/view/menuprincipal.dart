import 'package:flutter/material.dart';
import 'package:obracalc/generic/botaomenu.dart';

class menuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf5f5f5),
      appBar: AppBar(
        title: Text("Menu Principal"),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: btnGenericoMenu("Clientes", '/menuClientes', Icons.person_outline_rounded),
          ),
          btnGenericoMenu('Orçamento', '/menuOrcamento', Icons.attach_money_rounded),
          btnGenericoMenu('Serviços', '/menuServicos', Icons.construction_outlined),
          btnGenericoMenu('Unidade de Medida', '/menuUndMedidas', Icons.construction_outlined),
          btnGenericoMenu('Materiais', '/menuMateriais', Icons.house_outlined),
          btnGenericoMenu("Traços", '/menuTraco', Icons.all_inclusive),
          btnGenericoMenu("Usuários", '/menuUsuarios', Icons.account_circle_outlined),
        ],
      ),
    );
  }
}
