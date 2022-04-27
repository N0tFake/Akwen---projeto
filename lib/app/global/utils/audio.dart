import 'package:audioplayers/audioplayers.dart';

Future<AudioPlayer> playaudioChallenge(bool _isRight) async {
  AudioCache cache = AudioCache();
  if(_isRight){
    return await cache.play('sonds/correct.mp3');
  }
  return await cache.play('sonds/incorrect.mp3');
}

/* AudioCache cache = AudioCache();
AudioPlayer player = AudioPlayer();
Future<void> playaudioBackground(bool play) async {
  if(play){
    //player.stop();
    _play(player, cache);
  }else{
    _stop(player);
  }

}

void _play(AudioPlayer player, AudioCache cache) async{
  player = await cache.play('sonds/background/01.mp3');
}

void _stop(AudioPlayer player) {
  //await player.stop();
  player.pause();
} */