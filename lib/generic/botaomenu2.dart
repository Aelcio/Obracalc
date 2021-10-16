import 'package:flutter/material.dart';

class  btnGenericoMenu2 extends StatelessWidget {

  final String _nomeBotao;
  final String _chamada;

  btnGenericoMenu2(this._nomeBotao, this._chamada);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: ElevatedButton(
          onPressed: () => {Navigator.pushNamed(context,
              _chamada,)},
          child : Text(
            _nomeBotao,
            style: TextStyle(color: Colors.brown, fontSize: 14.0,),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              minimumSize: Size(170, 150))),
    );
  }
}

// child: ElevatedButton.icon(
// icon: Icon(Icons.add, color: Colors.blue ,size: 24.0,),
// onPressed: () => {Navigator.pushNamed(context,
// _chamada,)},
// label: Text(
// _nomeBotao,
// style: TextStyle(color: Colors.black, fontSize: 20.0),
// ),
// style: ElevatedButton.styleFrom(
// primary: Colors.white,
// minimumSize: Size(170, 150))),


