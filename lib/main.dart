import 'package:flutter/material.dart';
import 'package:obracalc/view/cadclientes.dart';
import 'package:obracalc/view/cadservicos.dart';
import 'package:obracalc/view/cadundmedidas.dart';
import 'package:obracalc/view/cadusuarios.dart';
import 'package:obracalc/view/cardmateriais.dart';
import 'package:obracalc/view/listracoconcreto.dart';
import 'package:obracalc/view/listtracoargamassa.dart';
import 'package:obracalc/view/menuMateriais.dart';
import 'package:obracalc/view/menuprincipal.dart';
import 'package:obracalc/view/menutracos.dart';
import 'package:obracalc/view/menuundmedida.dart';
import 'package:obracalc/view/orcamento.dart';
import 'package:obracalc/view/pesquisarmateriais.dart';
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
        '/orcamento': (context) => Orcamento(),
        '/cadMateriais': (context) => cadMateriais(),
        '/pesquisaMateriais': (context) => pesquisaMateriais(),
        '/menuUndMedidas': (context) => menuUndMedidas(),
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
