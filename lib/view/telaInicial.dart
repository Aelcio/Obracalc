import 'package:flutter/material.dart';
import 'package:obracalc/view/biometria.dart';
import 'package:obracalc/view/telalogin.dart';

class telaInicial extends StatelessWidget {
  const telaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Obra Calc'), actions: <Widget>[
        // ElevatedButton(
        //   child: Text("Entrar",),
        //   onPressed: () {
        //     Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context)=> telaLogin())
        //     );
        //   },
        // )
      ]),
      body: Container(
          child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => telaBiometria()));
            },
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/fundoobracalc.png'),
            fit: BoxFit.cover,
          ))),
    );
  }
}
