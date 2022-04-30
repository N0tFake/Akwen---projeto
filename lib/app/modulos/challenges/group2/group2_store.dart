import 'package:audioplayers/audioplayers.dart';
import 'package:mobx/mobx.dart';

part 'group2_store.g.dart';

class Group2Store = _Group2StoreBase with _$Group2Store;
abstract class _Group2StoreBase with Store {

  @observable
  int numDesafio = 1;
  @action 
  void setNumDesfio(int value) =>  numDesafio += value;

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
    numDesafio = 1;
    pts = 0;
  } 
}