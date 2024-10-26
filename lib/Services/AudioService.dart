import 'package:audioplayers/audioplayers.dart';

class AudioService{

  static final player = AudioPlayer();

  static playAudio(String audioPath)async{
    await player.play(AssetSource(audioPath));
  }

}