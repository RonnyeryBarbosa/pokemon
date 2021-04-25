import 'dart:math';

import 'package:pokemon/api.dart';
import 'package:pokemon/screens/pokemon/pokemon.dart';

class PokerModel {
  final int _number = 0;

  Future<Pokemon> _pokemon;

  Future<Pokemon> get pokemon => _pokemon;

  int get number => _number;

  fetchPokemon(int number) {
    _pokemon = API().fetchPokemon(Random().nextInt(1000));
  }
}
