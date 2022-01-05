import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(6.0),
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
          //enabled: false,
          //enabledBorder: InputBorder.none,
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.cyan)),

          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: Colors.red,
            ),
          ),
          prefixIcon: Icon(_icone, color: Color(0xFF0D99BE)),
          labelText: (_rotulo),
          hintText: (_dica),
          //icon: Icon(_icone),
          contentPadding: EdgeInsets.symmetric( horizontal: 20.0,vertical: 10.0),
        ),
        keyboardType: _tipoTeclado,
        textCapitalization: _cap,
      ),
    );
  }
}