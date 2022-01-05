import 'package:flutter/material.dart';
import 'package:obracalc/generic/app_bar_customizada.dart';
import 'package:obracalc/generic/botaomenu.dart';
import 'package:obracalc/view/cadmateriais.dart';

class menuMateriais extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe0e0e0),
      // appBar: AppBar(
      //   title: Text("Materiais"),
      // ),
      appBar: AppBarCustomizada(titulo: 'Materiais',),
        body: Container(
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [

                Expanded(child:
                btnGenericoMenu("Pesquisar",'/consultaMateriais', Icons.search),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
