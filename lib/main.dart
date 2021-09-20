import 'package:flutter/material.dart';
import 'package:obracalc/view/cadclientes.dart';
import 'package:obracalc/view/cadservicos.dart';
import 'package:obracalc/view/cadundmedidas.dart';
import 'package:obracalc/view/cadusuarios.dart';
import 'package:obracalc/view/cardmateriais.dart';
import 'package:obracalc/view/consultaClientes.dart';
import 'package:obracalc/view/consultaMateriais.dart';
import 'package:obracalc/view/consultaorcamento.dart';
import 'package:obracalc/view/consultaservicos.dart';
import 'package:obracalc/view/consultaundmedidas.dart';
import 'package:obracalc/view/consultausuartios.dart';
import 'package:obracalc/view/listracoconcreto.dart';
import 'package:obracalc/view/listtracoargamassa.dart';
import 'package:obracalc/view/menuMateriais.dart';
import 'package:obracalc/view/menuServicos.dart';
import 'package:obracalc/view/menuclientes.dart';
import 'package:obracalc/view/menuorcamento.dart';
import 'package:obracalc/view/menuprincipal.dart';
import 'package:obracalc/view/menutracos.dart';
import 'package:obracalc/view/menuundmedida.dart';
import 'package:obracalc/view/menuusuarios.dart';
import 'package:obracalc/view/orcamento.dart';
import 'package:obracalc/view/alteraclientes.dart';
import 'package:obracalc/view/pesquisarmateriais.dart';
import 'package:obracalc/view/pesquisaservicos.dart';
import 'package:obracalc/view/pesquisaundmedida.dart';
import 'package:obracalc/view/telaInicial.dart';

void main() {
  runApp(ObraCalc());
}

class ObraCalc extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/menuTraco': (context) => menuTraco(),
        '/cadClientes': (context) => cadClientes(),
        '/cadUndMedida': (context) => cadUndMedida(),
        '/cadUsuarios': (context) => cadUsuarios(),
        '/cadClientes': (context) => cadClientes(),
        '/listaTracoArgamassa': (context) => listaTracoArgamassa(),
        '/listaTracoConcreto': (context) => listaTracoConcreto(),
        '/menuMateriais': (context) => menuMateriais(),
        '/menuPrincipal': (context) => menuPrincipal(),
        '/menuTraco': (context) => menuTraco(),
        '/cadServicos': (context) => cadServicos(),
        '/consultaServicos': (context) => consultaServicos(),
        '/menuServicos': (context) => menuServicos(),
        '/orcamento': (context) => Orcamento(),
        '/menuOrcamento': (context) => menuOrcamento(),
        '/consultaOrcamento': (context) => consultaOrcamentos(),
        '/cadMateriais': (context) => cadMateriais(),
        '/consultaMateriais': (context) => consultaMateriais(),
        '/menuUndMedidas': (context) => menuUndMedida(),
        '/consultaUndMedida': (context) => consultaUndMedida(),
        '/menuClientes': (context) => menuClientes(),
        '/consultaClientes': (context) => consultaClientes(),
        '/menuUsuarios': (context) => menuUsuarios(),
        '/consultaUsuarios': (context) => consultaUsuarios(),
      },
      title: 'Obra Calc',
      theme: ThemeData(
        primaryColor: Color(0xFFa1887f),
        //primaryColor: Color(0xFF388e3c),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(backgroundColor: Color(0xFFbcaaa4)),
            //style: TextButton.styleFrom(backgroundColor: Color(0xFF388e3c)),

        ),
      ),
      home: telaInicial(),
    );
  }
}
