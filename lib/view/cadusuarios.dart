import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:obracalc/controller/usuarioControle.dart';
import 'package:obracalc/generic/app_bar_customizada.dart';
import 'package:obracalc/models/usuariosModelo.dart';

class cadUsuarios extends StatelessWidget {
  final TextEditingController _controladorCampoNome = TextEditingController();
  final TextEditingController _controladorCampoLogin = TextEditingController();
  final TextEditingController _controladorCampoSenha = TextEditingController();
  final UsuarioControle _dao = UsuarioControle();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
      backgroundColor: Color(0xFFf5f5f5),
        appBar: AppBarCustomizada(titulo: 'Cadastro Usuários',),
      //bottomNavigationBar: BottomNavigationBar(currentI,ndex: 0, items: [],),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Editor(_controladorCampoNome, 'Nome', 'Nome Completo', Icons.person, TextInputType.text, TextCapitalization.words),
          Editor(_controladorCampoLogin, "Login", "", Icons.account_circle, TextInputType.text, TextCapitalization.none),
          //Editor(_controladorCampoSenha, "Senha", "", Icons.lock_open),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              validator: (value){
                if(value!.isEmpty){
                  return 'Campo Obrigatório';
                }else{
                  return null;
                }
              },
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

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                child: Text(
                  "Cadastrar", style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if(_formKey.currentState!.validate()) {
                    final String nome = _controladorCampoNome.text;
                    final String login = _controladorCampoLogin.text;
                    final String senha = _controladorCampoSenha.text;
                    final Usuario newUsuario = Usuario(0, nome, login, senha);
                    _dao.saveUsuario(newUsuario).then((idUsario) =>
                        Navigator.pop(context));

                    Fluttertoast.showToast(
                        msg: "Usuário cadastrado com sucesso!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black12,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    //Navigator.pushNamed(context, '/menuPrincipal');
                  }},
                style: ElevatedButton.styleFrom(
                    padding:
                    EdgeInsets.symmetric(horizontal: 50, vertical: 12.0),
                  primary: Color(0xFF0D99BE),
                    textStyle: TextStyle(
                      fontSize: 18,
                    )))
            ,
          )
        ],
      ),
    ));
  }
}

class Editor extends StatelessWidget {
  final TextEditingController _controlador;
  final String _rotulo;
  final String _dica;
  final IconData _icone;
  final TextInputType _tipoTeclado;
  final TextCapitalization _cap;

  const Editor(this._controlador, this._rotulo, this._dica, this._icone, this._tipoTeclado, this._cap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value){
          if(value!.isEmpty){
            return 'Campo Obrigatório';
          }else{
            return null;
          }
        },
        //textAlign: TextAlign.center,
        controller: _controlador,
        decoration: InputDecoration(
          //enabledBorder: InputBorder.none,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIcon: Icon(_icone, color: Color(0xFF4bacb8)),  
          labelText: (_rotulo),
          hintText: (_dica),
           //icon: Icon(_icone),
          contentPadding: EdgeInsets.symmetric( horizontal: 20.0,vertical: 12.0),
        ),
        keyboardType: _tipoTeclado,
        textCapitalization: _cap,
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
