import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:obracalc/controller/usuarioControle.dart';
import 'package:obracalc/models/usuariosModelo.dart';

final UsuarioControle _control = UsuarioControle();



class telaLogin extends StatefulWidget {
  @override
  State<telaLogin> createState() => _telaLoginState();
}

class _telaLoginState extends State<telaLogin> {
  final TextEditingController _controladorCampoLogin = TextEditingController();

  final TextEditingController _controladorCampoSenha = TextEditingController();

  final String lista = '';

  final UsuarioControle _dao = UsuarioControle();

  final _formKey = GlobalKey<FormState>();
  String users = 'Teste';

  String var_json = '{"login":"marta.macedo", "senha": "1234"}';

 // static var usuario;;

  @override
  Widget build(BuildContext context) {

    void recuperarUsuarios() async{
      List usuariosRecuperados = await _dao.listarUsuarios();

      String Vjson = usuariosRecuperados.toString();

      print(Vjson);
    }

    void consultaUser() async {
      setState(() {
        Map json = jsonDecode(var_json);
        if (json["login"] == _controladorCampoLogin.text &&
            json["senha"] == _controladorCampoSenha.text) {
          Navigator.pushNamed(context, '/homeScreen');
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

    void teste(){
      final String nome = '';
      final String login = _controladorCampoLogin.text;
      final String senha = _controladorCampoSenha.text;
      final Usuario user = Usuario(0, nome, login, senha);
      if(user.login == login && user.senha == senha){
        print(user.senha);
      }
    }
    return Form(
      key: _formKey,
      child: Scaffold(
      backgroundColor: Color(0xFFf5f5f5),
      //appBar: AppBar(title: Text("Login")),
      //bottomNavigationBar: BottomNavigationBar(currentIndex: 0, items: [],),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Editor(
               _controladorCampoLogin, "Login", "", Icons.account_circle_outlined,
                TextInputType.text

            ),
            //Editor(_controladorCampoSenha, "Senha", "", Icons.lock_open, TextInputType.text),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                validator: (value){
                  if(value!.isEmpty) return "Campo Obrigatório";
                  return null;
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
                    //color: Color(0xFF4bacb8),
                      color: Color(0xFF0D99BE),

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
                    "Entrar",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      consultaUser();
                      recuperarUsuarios();
                      //teste();
                      //print(user);
                  }},
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 12.0),
                      primary: Color(0xFF0D99BE),
                      textStyle: TextStyle(
                        fontSize: 18,
                      )),
                    ),
            ),
            Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextButton(
                    child: Text(
                      'Cadastrar-se',
                      style: TextStyle(fontSize: 18, color: Color(0xFF0D99BE)),
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
      ),
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
            color: Color(0xFF0D99BE),
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
