import 'package:flutter/material.dart';

class  btnGenericoMenu extends StatelessWidget {

  final String _nomeBotao;
  final String _chamada;

  btnGenericoMenu(this._nomeBotao, this._chamada);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: ElevatedButton(
          onPressed: () => {Navigator.pushNamed(context,
              _chamada,)},
          child: Text(
            _nomeBotao,
            style: TextStyle(color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              minimumSize: Size(170, 150))),
    );
  }
}
