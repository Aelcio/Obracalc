import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController _controlador;
  final String _rotulo;
  final String _dica;
  final IconData _icone;

  const Editor(this._controlador, this._rotulo, this._dica, this._icone);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: TextField(
        //textAlign: TextAlign.center,
        controller: _controlador,
        decoration: InputDecoration(
          //enabled: false,
          //enabledBorder: InputBorder.none,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),borderSide: BorderSide(
            color: Colors.red,
          )

          ),
          prefixIcon: Icon(_icone, color: Color(0xFF4bacb8)),
          labelText: (_rotulo),
          hintText: (_dica),

          //icon: Icon(_icone),
          contentPadding: EdgeInsets.symmetric( horizontal: 20.0,vertical: 10.0),
        ),
      ),
    );
  }
}