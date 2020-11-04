class Pokemon {
  String pokemonName;

  Pokemon({this.pokemonName});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(pokemonName: json['name']);
  }
}
