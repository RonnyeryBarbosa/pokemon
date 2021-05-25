import 'dart:async';
import 'dart:math';

import 'package:pokemon/screens/pokemon/pokemon.dart';
import 'package:pokemon/screens/pokemon/poker_model.dart';

class PokerViewModel {
  final _model = PokerModel();

  Future<Pokemon> get pokemon => _model.pokemon;

  StreamController<Pokemon> streamPokemon = StreamController();

  loadPokemon() {
    var id = Random().nextInt(1000);
    _model.fetchPokemon(id);
    _model.pokemon.then((value) {
      streamPokemon.add(value);
    });
  }
}
