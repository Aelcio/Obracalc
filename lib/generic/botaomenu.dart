import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class btnGenericoMenu extends StatelessWidget {
  final String _nomeBotao;
  final String _chamada;
  final IconData _icone;

  btnGenericoMenu(this._nomeBotao, this._chamada, this._icone);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ElevatedButton.icon(
              icon: Icon(
                _icone,
                color: Color(0xFF0D99BE),
              ),
              onPressed: () => {
                Navigator.pushNamed(
                  context,
                  _chamada,
                )
              },
              label: Text(
                _nomeBotao,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  primary: Colors.white,
                  minimumSize: Size(80, 90)),
            ),
          )
        ],
      ),
    );
  }
}
