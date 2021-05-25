import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/api.dart';
import 'package:pokemon/screens/pokemon/pokemon.dart';
import 'package:pokemon/screens/pokemon/poker_model.dart';

void main() {
  test('FetchPokemon should fill pokemon variable', () {
    final model = PokerModel(api: MockAPI());

    model.fetchPokemon(1);
    expect(model.pokemon, completion(isNotNull));
    model.pokemon.then((pokemon) {
      expect(pokemon.nome, 'Test');
    });
  });
}

class MockAPI extends API {
  @override
  Future<Pokemon> fetchPokemon(int number) {
    final pokemon = Pokemon("Test", 'null', 0, []);
    return Future.value(pokemon);
  }
}
