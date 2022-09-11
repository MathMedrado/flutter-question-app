import 'package:flutter/material.dart';
import 'package:projeto_perguntas/Questionario.dart';
import './resultado.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  final List<Map<String, Object>> _perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto' :'Vermelho', 'pontuacao' : 5 }, 
        {'texto' : 'Preto', 'pontuacao' : 10 }, 
        {'texto' :'Verde', 'pontuacao' : 3 }, 
        {'texto' :'Branco', 'pontuacao' : 1 },
        ],
    },
    {
      'texto': 'Qual é o seu animal preferido?',
      'respostas': [
          {'texto' : 'Coelho', 'pontuacao' : 10 }, 
          {'texto' : 'Cobra',  'pontuacao' : 5 }, 
          {'texto' : 'Elefante','pontuacao' : 3 }, 
          {'texto' : 'Leão', 'pontuacao' : 1 },
        ],
    },
    {
      'texto': 'Qual é o seu comida preferido?',
      'respostas': [
          {'texto' : 'Pizza', 'pontuacao'  : 10 }, 
          {'texto' : 'Pastel',  'pontuacao'  : 5 }, 
          {'texto' : 'Hamburger',  'pontuacao'  : 3 }, 
          {'texto' : 'Sorvete', 'pontuacao'  : 1 },
        ],
    },
    {
      'texto': 'Qual é o seu instrutor preferido?',
      'respostas': [
          {'texto' : 'Maria', 'pontuacao'  : 10 }, 
          {'texto' : 'João', 'pontuacao'  : 5 }, 
          {'texto' : 'Pedro',  'pontuacao'  : 3 }, 
          {'texto' : 'Paulo', 'pontuacao'  : 1 },
          
        ],
    },
  ];

  void _responder(int pontuacao) {
    setState(() {
      if (temPerguntaSelecionada) {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      }
    });
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    // List<Widget> widgets = respostas.map((textoResposta) => Resposta(textoResposta, _responder)).toList();

    // for(String textoResposta in respostas){
    //   widgets.add(Resposta(textoResposta, _responder));
    // }

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Questionario(perguntas: _perguntas, perguntaSelecionada: _perguntaSelecionada, quandoResponder: _responder)
              : Resultado(pontuacao: _pontuacaoTotal, reiniciarQuestionario: _reiniciarQuestionario,)
              // const Center(
              //     child: Text(
              //       'Parabéns',
              //       style: TextStyle(fontSize: 28),
              //     ),
              //   )
              ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
