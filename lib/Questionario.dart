import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {

  final List<Map<String,Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  const Questionario({ 
    required this.perguntas,
    required this.perguntaSelecionada, 
    required this.quandoResponder,
    super.key
  });



  @override
  Widget build(BuildContext context) {

    List<Map<String,Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(
      children: [
        Questao( perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((textoResposta) {
        return   Resposta(textoResposta['texto'].toString(),
        () =>  quandoResponder(int.parse(textoResposta['pontuacao'].toString())));
        }).toList(),
      ],
    );
  }
}