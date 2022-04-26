import 'package:audioplayers/audioplayers.dart';

Future<AudioPlayer> playaudioChallenge(bool _isRight) async {
  AudioCache cache = AudioCache();
  if(_isRight){
    return await cache.play('sonds/correct.mp3');
  }
  return await cache.play('sonds/incorrect.mp3');
}