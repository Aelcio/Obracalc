import 'package:flutter/material.dart';

class Botoes extends StatelessWidget {
  final String _textoBotao;

  const Botoes(this._textoBotao);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: Text(_textoBotao, style: TextStyle(color: Colors.white),),
        onPressed: () => null,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12.0),
            textStyle: TextStyle()),
      ),
    );
  }
}