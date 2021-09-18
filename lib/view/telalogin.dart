import 'package:flutter/material.dart';
import 'package:obracalc/view/menuprincipal.dart';
import 'package:obracalc/view/menutracos.dart';

class telaLogin extends StatelessWidget {
  final TextEditingController _controladorCampoLogin = TextEditingController();
  final TextEditingController _controladorCampoSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe0e0e0),
      appBar: AppBar(title: Text("Login")),
      //bottomNavigationBar: BottomNavigationBar(currentIndex: 0, items: [],),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Editor(_controladorCampoLogin, "Login", "", Icons.account_circle),
          Editor(_controladorCampoSenha, "Senha", "", Icons.lock_open),
          //botoes(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                child: Text(
                  "Entrar",
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
          )
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

  const Editor(this._controlador, this._rotulo, this._dica, this._icone);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        //textAlign: TextAlign.center,
        controller: _controlador,
        decoration: InputDecoration(
          //enabledBorder: InputBorder.none,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIcon: Icon(_icone, color: Colors.brown),
          labelText: (_rotulo),
          hintText: (_dica),
          //icon: Icon(_icone),
          //contentPadding: EdgeInsets.symmetric( horizontal: 20.0,vertical: 12.0),
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
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12.0),
            textStyle: TextStyle(fontSize: 18)),
      ),
    );
  }
}
