import 'package:flutter/material.dart';
import 'package:obracalc/controller/undmedidaControle.dart';
import 'package:obracalc/generic/app_bar_customizada.dart';
import 'package:obracalc/generic/campos.dart';
import 'package:obracalc/models/undmedidaModelo.dart';

class consultaUndMedida extends StatelessWidget {
  final UndMedidaControle _dao = UndMedidaControle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomizada(titulo: 'Consulta Unidade de Medida',),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<UnidadeMedida>>(
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
                final List<UnidadeMedida>? unidademedidas = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final UnidadeMedida medida = unidademedidas![index];
                    return _UnidadeMedidaItem(medida);
                  },
                  itemCount: unidademedidas!.length,
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

class _UnidadeMedidaItem extends StatelessWidget {
  final UnidadeMedida medida;

  _UnidadeMedidaItem(this.medida);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          medida.descricao,
          style: TextStyle(fontSize: 18.0),
        ),
        subtitle: Text(
          medida.descUndReduzida,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
