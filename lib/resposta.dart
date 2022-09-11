import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class Resposta extends StatelessWidget {

  final String texto;
  final void Function() quandoSelecionado;

  const Resposta(this.texto, this.quandoSelecionado,  {super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          foregroundColor: MaterialStateProperty.all(Colors.white)
        ),
        onPressed: quandoSelecionado,
        // style: ElevatedButton.styleFrom(
        //   // primary: Colors.red,
        //   // onPrimary: Colors.amberAccent
        // ),
        child: Text(texto),
      ),
    );
  }
}