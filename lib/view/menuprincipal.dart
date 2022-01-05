import 'package:flutter/material.dart';
import 'package:obracalc/generic/app_bar_customizada.dart';
import 'package:obracalc/generic/botaomenu.dart';

class menuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor:Color(0xFFe0e0e0),
        appBar: AppBarCustomizada(titulo: 'Menu Principal',),
        body: Container(
        child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: btnGenericoMenu(
                    "Clientes", '/menuClientes', Icons.person_outline_rounded),
              ),
              btnGenericoMenu(
                  'Orçamento', '/menuOrcamento', Icons.attach_money_rounded),
              btnGenericoMenu(
                  'Serviços', '/menuServicos', Icons.construction_outlined),
              btnGenericoMenu('Unidade de Medida', '/menuUndMedidas',
                  Icons.construction_outlined),
              btnGenericoMenu(
                  'Materiais', '/menuMateriais', Icons.house_outlined),
              btnGenericoMenu("Traços", '/menuTraco', Icons.all_inclusive),
              btnGenericoMenu(
                  "Usuários", '/menuUsuarios', Icons.account_circle_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
