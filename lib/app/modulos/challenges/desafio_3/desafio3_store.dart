import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_akwen/app/global/services/service.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_3/components/challenge/model_answer.dart';
import 'package:mobx/mobx.dart';

part 'desafio3_store.g.dart';

class Desafio3Store = _Desafio3StoreBase with _$Desafio3Store;
abstract class _Desafio3StoreBase with Store {

  final Services _services;
  _Desafio3StoreBase(this._services);

  TextEditingController answerController = TextEditingController();

  @observable
  int numberTask = 1;
  @action 
  void setNumberTask(int value) => numberTask += value;

  @observable
  String phraseAkwe1 = '';
  @observable
  String phraseAkwe2 = '';
  @observable
  String phraseAkwe3 = '';

  @observable
  String phrasePTBR1 = '';
  @observable
  String phrasePTBR2 = '';
  @observable
  String phrasePTBR3 = '';


  @observable
  ObservableList<ModelAnswer> listBtnsAnswerChoisen = ObservableList<ModelAnswer>().asObservable();
  @observable
  ObservableList<ModelAnswer> listBtnsAnswerOpcs = ObservableList<ModelAnswer>().asObservable();
  @action 
  addAnswerChoisen(ModelAnswer model){
    listBtnsAnswerChoisen.add(model);
  }
  @action 
  rmvAnswerChoisen(ModelAnswer model){
    int index = 0;
    for(int i = 0; i < listBtnsAnswerChoisen.length; i++){
      if(listBtnsAnswerChoisen[i].title == model.title){
        index = i;
        break;
      }
    }
    listBtnsAnswerChoisen.removeAt(index);
  }
  @action 
  addAnswerOpcs(ModelAnswer model){
    listBtnsAnswerOpcs.add(model);
  }
  @action 
  rmvAnswerOpcs(ModelAnswer model){
    int index = 0;
    for(int i = 0; i < listBtnsAnswerOpcs.length; i++){
      if(listBtnsAnswerOpcs[i].title == model.title){
        index = i;
        break;
      }
    }
    listBtnsAnswerOpcs.removeAt(index);
  }

  Future<void> getWords(String str)async {
    final List listTemp = str.split(' ');
    for (var element in listTemp) { 
      if(element != ''){
        ModelAnswer model = ModelAnswer(element);
        addAnswerOpcs(model);
      }
    }
  }



  @observable 
  bool first = true;

  @observable 
  String answer = '';
  @action 
  void setAnswer(value) => answer = value;

  @observable
  int pts = 0;
  @action 
  void setPTS(int value) => pts += value;

  @observable
  AudioCache cache = AudioCache();
  
  @observable
  AudioPlayer player = AudioPlayer();

  Future<void> stopAudioBackground() async {
    player.pause();
  }

  Future<void> playAudioBackground() async {
    player = await cache.loop('sonds/background/01.mp3');
  }


  void reset(){
    listBtnsAnswerChoisen.clear();
    listBtnsAnswerOpcs.clear();
    answerController.clear();
    answer = '';
    numberTask = 1;
    pts = 0;
  }

  void answerReset(){
    answerController.clear();
    answer = '';
  }

  bool get isChanged => answer.isNotEmpty;

  @action 
  Future<void> getDoc() async{
    try{
      DocumentSnapshot snapshot =  await _services.getChallengeDoc('Desafio03');
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

      var phrase = data['frases'];
      
      var _keys = phrase.keys.toList()..shuffle();
      var _values = [];

      for(var i in _keys){
        _values.add(phrase[i.toString()]);
      }

      phraseAkwe1 = _keys[0];
      phrasePTBR1 = _values[0];

      phraseAkwe2 = _keys[1];
      phrasePTBR2 = _values[1];

      phraseAkwe3 = _keys[2];
      phrasePTBR3 = _values[2];

    }catch(e){
      print(e.toString());
    }
  }

}