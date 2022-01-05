import 'package:flutter/material.dart';
import 'package:obracalc/controller/servicoControle.dart';
import 'package:obracalc/generic/app_bar_customizada.dart';
import 'package:obracalc/models/servicoModelo.dart';

class consultaServicos extends StatelessWidget {
  final TextEditingController _buscaCliente = TextEditingController();
  final ServicoControle _dao = ServicoControle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomizada(titulo: 'Consulta Serviços',),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<Servico>>(
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
                final List<Servico>? servicos = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Servico servico = servicos![index];
                    return _ServicoItem(servico);
                  },
                  itemCount: servicos!.length,
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

class _ServicoItem extends StatelessWidget {
  final Servico servico;

  _ServicoItem(this.servico);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          'Serviço: ' + servico.nomeServico,
          style: TextStyle(fontSize: 18.0),
        ),
        subtitle: Text(
          'Descrição: ' + servico.descricao,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
