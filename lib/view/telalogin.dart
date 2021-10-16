import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:obracalc/controller/usuarioControle.dart';
import 'package:obracalc/database/app_database.dart';
import 'package:obracalc/models/usuariosModelo.dart';
import 'package:sqflite/sqflite.dart';

class telaLogin extends StatefulWidget {
  @override
  State<telaLogin> createState() => _telaLoginState();
}

class _telaLoginState extends State<telaLogin> {
  final TextEditingController _controladorCampoLogin = TextEditingController();

  final TextEditingController _controladorCampoSenha = TextEditingController();

  final String lista = '';

  final UsuarioControle _dao = UsuarioControle();

  String var_json = '{"login":"aelcio.macedo", "senha": "1234"}';

  @override
  Widget build(BuildContext context) {
    void consultaUser() {
      setState(() {
        Map json = jsonDecode(var_json);
        if (json["login"] == _controladorCampoLogin.text &&
            json["senha"] == _controladorCampoSenha.text) {
          Navigator.pushNamed(context, '/menuPrincipal');
        } else {
          //print("Usuário não encontrado");
          Fluttertoast.showToast(
              msg: "Usuário ou Senha Inválidos!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black12,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      });
    }

    return Scaffold(
      backgroundColor: Color(0xFFf5f5f5),
      appBar: AppBar(title: Text("Login")),
      //bottomNavigationBar: BottomNavigationBar(currentIndex: 0, items: [],),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Editor(_controladorCampoLogin, "Login", "", Icons.account_circle,
              TextInputType.text),
          //Editor(_controladorCampoSenha, "Senha", "", Icons.lock_open, TextInputType.text),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _controladorCampoSenha,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                //enabledBorder: InputBorder.none,
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                prefixIcon: Icon(
                  Icons.lock_open,
                  color: Color(0xFF4bacb8),
                ),
                labelText: 'Senha',
                hintText: 'Senha',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              ),
            ),
          ),
          //botoes(),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
                child: Text(
                  "ENTRAR",
                ),
                onPressed: () {
                  consultaUser();
                },
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 50, vertical: 12.0),
                    textStyle: TextStyle(
                      fontSize: 18,
                    ))),
          ),
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                  child: Text(
                    'Cadastrar-se',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/cadUsuarios');
                  },
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    primary: Color(0xFFf5f5f5),
                  )))
        ],
      ),
    );
  }
}

class Editor extends StatelessWidget {
  final TextEditingController _controlador;
  final String _rotulo;
  final String _dica;
  final IconData _icone;
  final TextInputType _tipoEntrada;

  const Editor(this._controlador, this._rotulo, this._dica, this._icone,
      this._tipoEntrada);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        //textAlign: TextAlign.center,
        controller: _controlador,
        keyboardType: _tipoEntrada,
        decoration: InputDecoration(
          //enabledBorder: InputBorder.none,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          prefixIcon: Icon(
            _icone,
            color: Color(0xFF4bacb8),
          ),
          labelText: (_rotulo),
          hintText: (_dica),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        ),
      ),
    );
  }
}
