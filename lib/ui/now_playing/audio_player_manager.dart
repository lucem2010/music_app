import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class AudioPlayerManager {
  AudioPlayerManager._internal();
  static final AudioPlayerManager _instance =  AudioPlayerManager._internal();
  factory AudioPlayerManager() => _instance;

  final player = AudioPlayer();
  Stream<DurationState>? durationState;
  String songURL="";


  void prepare({bool isNewSong= false}) {
    durationState = Rx.combineLatest2<Duration, Duration, DurationState>(
      player.positionStream,
      player.bufferedPositionStream,
          (position, bufferedPosition) => DurationState(
        progress: position,
        buffered: bufferedPosition,
        total: player.duration, // Lấy duration từ player
      ),
    );
    if(isNewSong){
      player.setUrl(songURL);
    }

  }

  void updateSongUrl(String url){
  songURL= url;
  prepare();
  }

  void dispose(){
    player.dispose();
  }

}


class DurationState {
  const DurationState({
    required this.progress,
    required this.buffered,
    this.total,
  });

  final Duration progress;
  final Duration buffered;

  final Duration? total;
}
