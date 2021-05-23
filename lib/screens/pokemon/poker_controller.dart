import 'dart:async';

import 'package:pokemon/screens/pokemon/pokemon.dart';
import 'package:pokemon/screens/pokemon/poker_model.dart';

class PokerViewModel {
  final _model = PokerModel();

  Future<Pokemon> get pokemon => _model.pokemon;

  StreamController<Pokemon> streamPokemon = StreamController();

  loadPokemon() {
    _model.fetchPokemon();
    _model.pokemon.then((value) {
      streamPokemon.add(value);
    });
  }
}
