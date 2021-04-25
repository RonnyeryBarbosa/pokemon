class Pokemon {
  String nome;
  String urlImage;
  int experience;
  List<Ability> abilidades;

  Pokemon.fromJson(Map<String, dynamic> json) {
    nome = json['name'];
    urlImage = json['sprites']['front_default'];
    experience = json['base_experience'];
    abilidades = List<Ability>.from(
        json["abilities"].map((x) => Ability.fromJson(x['ability'])));
  }
}

class Ability {
  String name;

  Ability.fromJson(Map<String, dynamic> json) {
    print(json);
    name = json['name'];
  }
}
