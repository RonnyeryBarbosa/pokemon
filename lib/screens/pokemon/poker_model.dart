import 'dart:math';

import 'package:pokemon/api.dart';
import 'package:pokemon/screens/pokemon/pokemon.dart';

class PokerModel {
  final int _number = 0;

  Future<Pokemon> _pokemon;
  final API api;

  Future<Pokemon> get pokemon => _pokemon;

  PokerModel({this.api = const API()});

  int get number => _number;

  fetchPokemon(int id) {
    _pokemon = api.fetchPokemon(id);
  }
}
