import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_3/desafio3_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Tasks extends StatefulWidget {
  const Tasks(
      {Key? key,
      required this.phraseQuestion,
      required this.phraseCorrect,
      required this.isAkwe})
      : super(key: key);
  final String phraseQuestion;
  final String phraseCorrect;
  final bool isAkwe;

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  final Desafio3Store store = Modular.get();
  bool isRight = false;

  void confirm() {
    String phraseCorrectValue = widget.phraseCorrect.replaceAll(' ', '');
    String phraseAnswerValue = store.answer;
    phraseAnswerValue = phraseAnswerValue.replaceAll(' ', '');

    phraseAnswerValue = removeDiacritics(phraseAnswerValue);
    phraseCorrectValue = removeDiacritics(phraseCorrectValue);

    phraseAnswerValue = phraseAnswerValue.toLowerCase();
    phraseCorrectValue = phraseCorrectValue.toLowerCase();

    if (phraseCorrectValue == phraseAnswerValue) {
      isRight = true;
    } else {
      isRight = false;
    }

    _showDialog(isRight);
  }

  @override
  Widget build(BuildContext context) {
    final String questionOrder = widget.isAkwe == true ? "Akwe para português" : "Português para Akwe";
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
       appBar: AppBar(
        title: Text('Traduza o enunciado abaixo, de $questionOrder:', style: const TextStyle(fontSize: 15),),
        leading: IconButton(
          onPressed: () => Modular.to.navigate('/home'),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Container(
          width: screen.width * 0.8,
          padding: const EdgeInsets.only(bottom: 40, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.phraseQuestion),
              Observer(builder: (_) {
                return TextFormField(
                  controller: store.answerController,
                  onChanged: store.setAnswer,
                  decoration: const InputDecoration(
                    hintText: 'Traduza a frase',
                    border: OutlineInputBorder(),
                  ),
                );
              }), 
              Observer(
                builder: (_) {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(screen.width * 0.8, 50)),
                      onPressed: store.isChanged ? confirm : null,
                      child: const Text("Confirmar"));
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _showDialog(bool _isRight){
    return showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (BuildContext context) => AlertDialog(
        content:  _isRight ? const Text('Resposta certa +10pts') : const Text('Resposta errada'),
        actions: [
          TextButton(
            onPressed: (){
              if(_isRight == true){
                store.setPTS(10);
              }
                store.setNumberTask(1);
                store.answerReset();
                Navigator.of(context).pop();
            }, 
            child: const Text('Proximo')
          )
        ],
      )
    );
  }

}
