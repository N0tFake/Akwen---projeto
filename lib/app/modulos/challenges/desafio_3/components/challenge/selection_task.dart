
import 'dart:math';

import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/global/components/img_background.dart';
import 'package:flutter_akwen/app/global/utils/audio.dart';
import 'package:flutter_akwen/app/global/utils/schemas.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_3/components/challenge/model_answer.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_3/components/show_dialog_desafio03.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_3/desafio3_store.dart';
import 'package:flutter_akwen/app/modulos/home/home_module.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class SelectionTasks extends StatefulWidget {
  const SelectionTasks({ Key? key, required this.phraseQuestion, required this.phraseCorrect }) : super(key: key);
  final String phraseQuestion;
  final String phraseCorrect;

  @override
  State<SelectionTasks> createState() => _SelectionTasksState();
}

class _SelectionTasksState extends State<SelectionTasks> {

  final Desafio3Store store = Modular.get();

  bool isRight = false;

  void confirm(BuildContext context) {

    String phraseCorrectValue = widget.phraseCorrect.replaceAll(' ', '');
    phraseCorrectValue = removeDiacritics(phraseCorrectValue);
    String phraseAnswerValue = '';

    for(int i =0; i < store.listBtnsAnswerChoisen.length; i ++){
      phraseAnswerValue += store.listBtnsAnswerChoisen[i].title; 
    }

    phraseAnswerValue = removeDiacritics(phraseAnswerValue);

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

  void fakeWords(){
    List<String> words = [];

    if(store.listBtnsAnswerOpcs.length <= 2){

      List wordsChallenge01 = store.phrasePTBR1.split(' '); 
      for(var element in wordsChallenge01){
        if(element != ''){
          if(store.listBtnsAnswerOpcs.contains(element) == false){
              words.add(element);
          }
        }
      }
      List wordsChallenge02 = store.phrasePTBR2.split(' '); 
      for(var element in wordsChallenge02){
        if(element != ''){
          if(store.listBtnsAnswerOpcs.contains(element) == false){
              words.add(element);
          }
        }
      }
      words.shuffle();
      ModelAnswer model01 = ModelAnswer(words[0]);
      store.addAnswerOpcs(model01);
      int tamanho = words.length -1;
      ModelAnswer model02 = ModelAnswer(words[tamanho]);
      store.addAnswerOpcs(model02);
      print(store.listBtnsAnswerOpcs);

    } else if(store.listBtnsAnswerOpcs.length == 3){

      var random = Random();
      int number = random.nextInt(1);

      List wordsChallenge01 = number == 0 
      ? store.phrasePTBR1.split(' ') : store.phrasePTBR2.split(' '); 
      for(var element in wordsChallenge01){
        if(element != ''){
          if(store.listBtnsAnswerOpcs.contains(element) == false){
              words.add(element);
          }
        }
      }
      words.shuffle();
      ModelAnswer model = ModelAnswer(words[0]);
      store.addAnswerOpcs(model);
    }
  }

  void generateRandomPosition(){
    store.listBtnsAnswerOpcs = store.listBtnsAnswerOpcs..shuffle();
  }

  void constructAnswer(ModelAnswer model){
    store.rmvAnswerOpcs(model);
    store.addAnswerChoisen(model);
  }

  void resetChoisen(ModelAnswer model){
    store.rmvAnswerChoisen(model);
    store.addAnswerOpcs(model);  
  }

  @override
  void initState() {
    // TODO: implement initState
    store.getWords(widget.phraseCorrect.toString());
    fakeWords();
    generateRandomPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    child: Text('Traduza a frase abaixo:', 
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
                    decoration: const BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )
                      ),
                    child: Text(widget.phraseQuestion, 
                      style: _textStyle(), 
                      textAlign: TextAlign.center,
                    )
                  ),
                  
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 25,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    width: screen.width * 0.8,
                    height: screen.height * 0.2,
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: Observer(builder: (_) {
                      return SizedBox(
                        width: screen.width * 0.8,
                        child: Wrap(
                          spacing: -1,
                          children: store.listBtnsAnswerChoisen
                            .map((element) => Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton.icon(
                                icon: const Icon(Icons.close, color: Colors. white,),
                                style: _elevatedButtonStyleSelection(),
                                onPressed: () => resetChoisen(element), 
                                label: Text(element.title),
                              ),
                            )).toList(),
                        )
                      );
                    }),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: screen.width * 0.8,
                    height: 200,
                    child: Observer(builder: (_) {
                      return Wrap(
                        alignment: WrapAlignment.center,
                        spacing: -1,
                        children: store.listBtnsAnswerOpcs
                          .map((element) => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                              style: _elevatedButtonStyleSelection(),
                              onPressed: () => constructAnswer(element), 
                              child: Text(element.title,
                                style: _textStyleSelections()
                              )
                            ),
                          )).toList(),
                        );
                    }),
                  ),
                ],
              ),

              const SizedBox(),
              Observer(
                builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(screen.width * 0.8, 50),
                          primary: greenColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                          ),
                          shadowColor: Colors.black
                        ),
                          onPressed: store.listBtnsAnswerChoisen.isNotEmpty ? () => confirm(context) : null,
                        child: Text("Confirmar", 
                          style: _textStyle()),
                        ),
                  );
                },
              )
            ],
          ),
        )
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

  TextStyle _textStyleSelections(){
    return const TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.bold,
    );
  }

  ButtonStyle _elevatedButtonStyleSelection(){
    return ElevatedButton.styleFrom(
      primary: greenColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5)
      ),
      shadowColor: Colors.black
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
