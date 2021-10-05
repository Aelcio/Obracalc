import 'package:flutter/material.dart';
import 'package:obracalc/view/cadusuarios.dart';
import 'package:obracalc/view/menuprincipal.dart';
import 'package:obracalc/view/menutracos.dart';
import 'package:path/path.dart';

class telaLogin extends StatelessWidget {
  final TextEditingController _controladorCampoLogin = TextEditingController();
  final TextEditingController _controladorCampoSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf5f5f5),
      appBar: AppBar(title: Text("Login")),
      //bottomNavigationBar: BottomNavigationBar(currentIndex: 0, items: [],),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Editor(_controladorCampoLogin, "Login", "", Icons.account_circle, TextInputType.text),
          //Editor(_controladorCampoSenha, "Senha", "", Icons.lock_open, TextInputType.text),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                //enabledBorder: InputBorder.none,
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),

                ),
                  prefixIcon: Icon(Icons.lock_open,
                    color: Color(0xFF4bacb8),
                  ),
                labelText: 'Senha',
                hintText: 'Senha',
                contentPadding: EdgeInsets.symmetric( horizontal: 20.0,vertical: 12.0),
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
                  Navigator.pushNamed(context, '/menuPrincipal');
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

  const Editor(this._controlador, this._rotulo, this._dica, this._icone, this._tipoEntrada);

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
          contentPadding: EdgeInsets.symmetric( horizontal: 20.0,vertical: 12.0),
        ),
      ),
    );
  }
}

class botoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: Text("Entrar"),
        onPressed: () => null,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 12.0),
            textStyle: TextStyle(fontSize: 18)),
      ),
    );
  }
}
