import 'package:pokemon/screens/pokemon/pokemon.dart';
import 'package:pokemon/screens/pokemon/poker_model.dart';

class PokerController {
  final model = PokerModel();

  Future<Pokemon> get pokemon => model.pokemon;

  loadPokemon() {
    model.fetchPokemon(10);
  }
}
