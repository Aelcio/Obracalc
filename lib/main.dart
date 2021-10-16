// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:obracalc/database/app_database.dart';
import 'package:obracalc/models/usuariosModelo.dart';
import 'package:obracalc/view/cadclientes.dart';
import 'package:obracalc/view/cadservicos.dart';
import 'package:obracalc/view/cadundmedidas.dart';
import 'package:obracalc/view/cadusuarios.dart';
import 'package:obracalc/view/cadmateriais.dart';
import 'package:obracalc/view/consultaClientes.dart';
import 'package:obracalc/view/consultaMateriais.dart';
import 'package:obracalc/view/consultaorcamento.dart';
import 'package:obracalc/view/consultaservicos.dart';
import 'package:obracalc/view/consultaundmedidas.dart';
import 'package:obracalc/view/consultausuarios.dart';
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
import 'package:obracalc/view/telalogin.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:obracalc/controller/usuarioControle.dart';

void main() {
  runApp(ObraCalc());
}

class ObraCalc extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/menuTraco': (context) => menuTraco(),
        '/cadClientes': (context) => cadClientes(),
        '/cadUndMedida': (context) => cadUndMedida(),
        '/cadUsuarios': (context) => cadUsuarios(),
        '/listaTracoArgamassa': (context) => listaTracoArgamassa(),
        '/listaTracoConcreto': (context) => listaTracoConcreto(),
        '/menuMateriais': (context) => menuMateriais(),
        '/menuPrincipal': (context) => menuPrincipal(),
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
        primaryColor: Color(0xFF4bacb8),
        accentColor: Color(0xFFf5f5f5),
        splashColor: Colors.yellow,
        primarySwatch: Colors.cyan,
        //primaryColor: Color(0xFFa1887f),
        //primaryColor: Color(0xFF388e3c),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(backgroundColor: Color(0xFF4bacb8)),
          //style: TextButton.styleFrom(backgroundColor: Color(0xFF388e3c)),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

//==============================================================================
class MyHomePage extends StatefulWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);
  //final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 3,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFF4bacb8), Color(0xFF4bacb8)],
        ),
        navigateAfterSeconds: telaLogin(),
        loaderColor: Colors.transparent,
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/logoobracalcnome.png"),
            fit: BoxFit.none,
          ),
        ),
      ),
    ],
  );
}
