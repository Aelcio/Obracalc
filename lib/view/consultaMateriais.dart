import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:obracalc/controller/materialControle.dart';
import 'package:obracalc/generic/app_bar_customizada.dart';
import 'package:obracalc/generic/campos.dart';
import 'package:obracalc/models/materialModelo.dart';

class consultaMateriais extends StatelessWidget {
  final MaterialControle _dao = MaterialControle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomizada(titulo: 'Consulta Materiais',),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<MaterialModelo>>(
          initialData: [],
          future: _dao.findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Text('Carregando...')
                    ],
                  ),
                );
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final List<MaterialModelo>? materiais = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final MaterialModelo material = materiais![index];
                    return _MaterialItem(material);
                  },
                  itemCount: materiais!.length,
                );
                break;
            }
            return Text('Erro');
          },
        ),
      ),
    );
  }
}

class _MaterialItem extends StatelessWidget {
  final MaterialModelo material;

  _MaterialItem(this.material);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          material.descricao,
          style: TextStyle(fontSize: 18.0),
        ),
        subtitle: Text(
          "Valor: " + material.valor.toString(),
          //style: TextStyle(fontSize: 16.0),
        ),
        trailing: Container(
          width: 50,
          child: Row(
            children: [
              GestureDetector(
              child: IconButton(
                icon: Icon(Icons.edit),
                color: Color(0xFF0A87A6),
                onPressed: () {

                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
