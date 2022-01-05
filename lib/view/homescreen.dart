import 'package:flutter/material.dart';
import 'package:obracalc/view/menuorcamento.dart';
import 'package:obracalc/view/menuprincipal.dart';
import 'package:obracalc/view/menutracos.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _indiceAtual = 0; // Variável para controlar o índice das telas

  final List<Widget> _telas = [
    menuPrincipal(),
    menuOrcamento(),
    menuTraco()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Container(child: Icon(Icons.menu)),

            title: Text("Menu"),

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              title: Text("Orçamento")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.construction),
              title: Text("Traços")
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}