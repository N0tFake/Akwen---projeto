import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_akwen/app/global/services/service.dart';
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

  @computed 
  Future<void> stopAudioBackground() async {
    player.pause();
  }

  Future<void> playAudioBackground() async {
    player = await cache.loop('sonds/background/01.mp3');
  }


  void reset(){
    answerController.clear();
    answer = '';
    numberTask = 1;
    pts = 0;
  }

  void answerReset(){
    answerController.clear();
    answer = '';
  }

  @computed 
  bool get isChanged => answer.isNotEmpty;

  @action 
  Future<void> getDoc() async{
    try{
      DocumentSnapshot snapshot =  await _services.getChallengeDoc('Desafio03');
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

      var phrase = data['frases'];

      phraseAkwe1 = phrase.keys.toList()[0];
      phrasePTBR1 = phrase.values.toList()[0];

      phraseAkwe2 = phrase.keys.toList()[1];
      phrasePTBR2 = phrase.values.toList()[1];

      phraseAkwe3 = phrase.keys.toList()[2];
      phrasePTBR3 = phrase.values.toList()[2];

    }catch(e){
      print(e.toString());
    }
  }

}