import 'package:flutter/material.dart';
import 'package:obracalc/generic/botaomenu.dart';

import 'package:obracalc/view/listracoconcreto.dart';

class menuTraco extends StatelessWidget {
  const menuTraco({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe0e0e0),
      appBar: AppBar(
        title: Text("Traços"),
      ),
      body: Container(
        width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
          children: [
              Expanded(child:
              btnGenericoMenu("Cadastrar", '/menuTraco', Icons.add),
              ),
              Expanded(child:
              btnGenericoMenu("Pesquisar", '/menuTraco', Icons.search),
              ),
          ],
        ),
            ),
      ),
    );
  }
}
