import 'dart:async';

import 'package:untitled/data/model/song.dart';
import 'package:untitled/data/repository/repository.dart';

class MusicAppViewModel {
  StreamController<List<Song>> songStream= StreamController();

  void loadSongs(){
    final repository=DefaultRepository();
    repository.loadData().then((value)=>songStream.add(value!));
  }
}