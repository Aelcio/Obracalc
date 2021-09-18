import 'package:flutter/material.dart';
import 'package:obracalc/generic/botaomenu.dart';
import 'package:obracalc/view/listracoconcreto.dart';

class menuTraco extends StatelessWidget {
  const menuTraco({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Traços"),
      ),
      body: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Column(
                children: [
                 // btnGenericoMenu(
                    //  "Concreto",
                      //(MaterialPageRoute(
                        //  builder: (context) => listaTracoConcreto()))),
                ],
              ),
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Column(
                children: [
                  //btnGenericoMenu(
                      //"Argamassa",
                     // (MaterialPageRoute(
                         // builder: (context) => listaTracoConcreto()))),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
