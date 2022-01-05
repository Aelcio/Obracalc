import 'package:flutter/material.dart';
import 'package:obracalc/controller/pessoaControle.dart';
import 'package:obracalc/generic/app_bar_customizada.dart';
import 'package:obracalc/generic/campos.dart';
import 'package:obracalc/models/pessoaModelo.dart';

class consultaClientes extends StatelessWidget {
  final TextEditingController _buscaCliente = TextEditingController();
  final PessoaControle _dao = PessoaControle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomizada(titulo: 'Consulta Clientes',),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<PessoaModelo>>(
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
                final List<PessoaModelo>? pessoas = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final PessoaModelo pessoa = pessoas![index];
                    return _PessoaItem(pessoa);
                  },
                  itemCount: pessoas!.length,
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

class _PessoaItem extends StatelessWidget {
  final PessoaModelo pessoa;

  _PessoaItem(this.pessoa);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          pessoa.nomePessoa,
          style: TextStyle(fontSize: 18.0),
        ),
        subtitle: Text(
          pessoa.cpf ,
          //pessoa.cnpj,
          style: TextStyle(fontSize: 16.0),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  color: Color(0xFF0A87A6),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  color: Color(0xFF0A87A6),
                  onPressed: () {},
                ),
            ],
          ),
        ),
      ),
    );
  }
}
