import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/global/components/img_background.dart';
import 'package:flutter_akwen/app/global/utils/audio.dart';
import 'package:flutter_akwen/app/global/utils/schemas.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_3/components/show_dialog_desafio03.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_3/desafio3_store.dart';
import 'package:flutter_akwen/app/modulos/home/home_module.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

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

  void confirm(BuildContext context) {
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
    playaudioChallenge(isRight);
    ShowDialogRightDesafio03(context, _textStyle, store, isRight);
  }

  @override
  Widget build(BuildContext context) {
    final String questionOrder = widget.isAkwe == true ? "Akwẽ para português" : "Português para Akwẽ";
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: ImgBackground(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => {
                      store.stopAudioBackground(),
                      store.reset(),
                      Modular.to.navigate(HomeModule.routeName)
                    }, 
                    icon: const Icon(Icons.arrow_back_ios, color: greenColor, size: 40)
                  ),
                  Expanded(
                    child: Text('Traduza o enunciado abaixo, de $questionOrder:', 
                      style: _textStyle() 
                    )
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(TablerIcons.fish, color: greenColor, size: 40,),
                    const SizedBox(width: 20,),
                    Text( '${store.pts}', 
                      style: const TextStyle(
                        fontFamily: 'Nunito', 
                        fontSize: 30,
                        fontWeight: FontWeight.w700
                      ),)
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    width: screen.width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(20)
                      ),
                    child: Text(widget.phraseQuestion, 
                      style: _textStyle(), 
                      textAlign: TextAlign.center,
                    )
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 25,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    width: screen.width * 0.8,
                    padding: const EdgeInsets.only(bottom: 5, top: 5),
                    child: Observer(builder: (_) {
                      return TextFormField(
                        controller: store.answerController,
                        onChanged: store.setAnswer,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Traduza a frase',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: greenColor, width: 2.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0), 
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0), 
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
              const SizedBox(),
              Observer(
                builder: (_) {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(screen.width * 0.8, 50),
                        primary: greenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                        ),
                        shadowColor: Colors.black
                      ),
                      onPressed: store.isChanged ? () => confirm(context) : null,
                      child: Text("Confirmar", 
                        style: _textStyle()),
                      );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _textStyle(){
    return const TextStyle(
      fontFamily: 'Nunito', 
      fontSize: 20, 
      fontWeight: FontWeight.bold,
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
