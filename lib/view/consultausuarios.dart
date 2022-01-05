import 'package:flutter/material.dart';
import 'package:obracalc/controller/usuarioControle.dart';
import 'package:obracalc/generic/app_bar_customizada.dart';
import 'package:obracalc/generic/campos.dart';
import 'package:obracalc/models/usuariosModelo.dart';
import 'package:obracalc/view/telalogin.dart';

class consultaUsuarios extends StatelessWidget {
  final TextEditingController _buscaUsuario = TextEditingController();
  final UsuarioControle _dao = UsuarioControle();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBarCustomizada(titulo: 'Consulta Usuários',),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<Usuario>>(
            initialData: [],
            future: _dao.GetUser(),
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
                  final List<Usuario>? usuarios = snapshot.data;
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final Usuario usuario = usuarios![index];
                      return _UsuarioItem(usuario);
                    },
                    itemCount: usuarios!.length,
                  );
                  break;
              }
              return Text('Erro');
            },
          ),
        ),
      ),
    );
  }
}

class _UsuarioItem extends StatelessWidget {
  final Usuario usuario;

  _UsuarioItem(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          'Nome: ' + usuario.nome,
          style: TextStyle(fontSize: 18.0),
        ),
        subtitle: Text(
          'Login: ' + usuario.login,
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
