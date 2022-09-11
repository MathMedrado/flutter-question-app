import 'package:flutter/material.dart';

class Resultado extends StatelessWidget{
  
  final int pontuacao;
  final void Function() reiniciarQuestionario;

  String get fraseResultado{
    if(pontuacao < 8){
      return 'A sua pontuação final foi $pontuacao, estude mais';
    }else{
      return 'A sua pontuação final foi $pontuacao, muito bem!';
    }
  }

  const Resultado({ required this.pontuacao, required this.reiniciarQuestionario, super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(fraseResultado,
            style: TextStyle(fontSize: 25),),
          ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            foregroundColor: MaterialStateProperty.all(Colors.white)
          ),
          onPressed: reiniciarQuestionario, 
          child: const Text(
            'Reiniciar o questionario'
          ))
      ],
    );
  }
}