class Pokemon {
  final int id;
  final String name;
  final int baseExperience;
  final int height;
  final bool isDefault;
  final int order;
  final int weight;
  final List<PokemonAbility> abilities;
  final List<PokemonForm> forms;
  final List<GameIndex> gameIndices;
  final List<HeldItem> heldItems;
  final List<LocationAreaEncounter> locationAreaEncounters;
  final List<Move> moves;
  final List<Stat> stats;
  final List<PokemonType> types;
  final List<PokemonType> pastTypes;
  final Species species;
  final Sprites sprites;

  Pokemon({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.isDefault,
    required this.order,
    required this.weight,
    required this.abilities,
    required this.forms,
    required this.gameIndices,
    required this.heldItems,
    required this.locationAreaEncounters,
    required this.moves,
    required this.stats,
    required this.types,
    required this.pastTypes,
    required this.species,
    required this.sprites,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'] ?? -1,
      name: json['name'] ?? '',
      baseExperience: json['base_experience'] ?? -1,
      height: json['height'] ?? -1,
      isDefault: json['is_default'] ?? false,
      order: json['order'] ?? -1,
      weight: json['weight'] ?? -1,
      abilities: json['abilities'] != null
          ? (json['abilities'] as List)
              .map((i) => PokemonAbility.fromJson(i))
              .toList()
          : [],
      forms: json['forms'] != null
          ? (json['forms'] as List).map((i) => PokemonForm.fromJson(i)).toList()
          : [],
      gameIndices: json['game_indices'] != null
          ? (json['game_indices'] as List)
              .map((i) => GameIndex.fromJson(i))
              .toList()
          : [],
      heldItems: json['held_items'] != null
          ? (json['held_items'] as List)
              .map((i) => HeldItem.fromJson(i))
              .toList()
          : [],
      locationAreaEncounters: json['location_area_encounters'] != null
          ? [LocationAreaEncounter(url: json['location_area_encounters'])]
          : [],
      moves: json['moves'] != null
          ? (json['moves'] as List).map((i) => Move.fromJson(i)).toList()
          : [],
      stats: json['stats'] != null
          ? (json['stats'] as List).map((i) => Stat.fromJson(i)).toList()
          : [],
      types: json['types'] != null
          ? (json['types'] as List).map((i) => PokemonType.fromJson(i)).toList()
          : [],
      pastTypes: json['past_types'] != null
          ? (json['past_types'] as List)
              .map((i) => PokemonType.fromJson(i))
              .toList()
          : [],
      species: json['species'] != null
          ? Species.fromJson(json['species'])
          : Species(name: '', url: ''),
      sprites: json['sprites'] != null
          ? Sprites.fromJson(json['sprites'])
          : Sprites.fromJson({}),
    );
  }
}

class PokemonAbility {
  final String name;
  final bool isHidden;
  final int slot;
  final String url;

  PokemonAbility({
    required this.isHidden,
    required this.slot,
    required this.name,
    required this.url,
  });

  factory PokemonAbility.fromJson(Map<String, dynamic> json) {
    return PokemonAbility(
      name: json['ability']['name'],
      isHidden: json['is_hidden'],
      slot: json['slot'],
      url: json['ability']['url'],
    );
  }
}

class PokemonForm {
  final String name;
  final String url;

  PokemonForm({
    required this.name,
    required this.url,
  });

  factory PokemonForm.fromJson(Map<String, dynamic> json) {
    return PokemonForm(
      name: json['name'],
      url: json['url'],
    );
  }
}

class GameIndex {
  final int gameIndex;
  final String versionName;
  final String versionUrl;

  GameIndex({
    required this.gameIndex,
    required this.versionName,
    required this.versionUrl,
  });

  factory GameIndex.fromJson(Map<String, dynamic> json) {
    return GameIndex(
      gameIndex: json['game_index'],
      versionName: json['version']['name'],
      versionUrl: json['version']['url'],
    );
  }
}

class HeldItem {
  final String name;
  final String url;
  final int versionDetailsRarity;
  final String versionDetailsVersionName;
  final String versionDetailsVersionUrl;

  HeldItem({
    required this.name,
    required this.url,
    required this.versionDetailsRarity,
    required this.versionDetailsVersionName,
    required this.versionDetailsVersionUrl,
  });

  factory HeldItem.fromJson(Map<String, dynamic> json) {
    return HeldItem(
      name: json['item']['name'],
      url: json['item']['url'],
      versionDetailsRarity: json['version_details'][0]['rarity'],
      versionDetailsVersionName: json['version_details'][0]['version']['name'],
      versionDetailsVersionUrl: json['version_details'][0]['version']['url'],
    );
  }
}

class LocationAreaEncounter {
  final String url;

  LocationAreaEncounter({
    required this.url,
  });

  factory LocationAreaEncounter.fromJson(Map<String, dynamic> json) {
    return LocationAreaEncounter(
      url: json['location_area']['url'],
    );
  }
}

class Move {
  final String name;
  final String url;

  Move({
    required this.name,
    required this.url,
  });

  factory Move.fromJson(Map<String, dynamic> json) {
    return Move(
      name: json['move']['name'],
      url: json['move']['url'],
    );
  }
}

class Stat {
  final String name;
  final String url;
  final int baseStat;
  final int effort;

  Stat({
    required this.name,
    required this.url,
    required this.baseStat,
    required this.effort,
  });

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(
      name: json['stat']['name'],
      url: json['stat']['url'],
      baseStat: json['base_stat'],
      effort: json['effort'],
    );
  }
}

class PokemonType {
  final String name;
  final String url;
  final int slot;

  PokemonType({
    required this.name,
    required this.url,
    required this.slot,
  });

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    return PokemonType(
      name: json['type']['name'],
      url: json['type']['url'],
      slot: json['slot'],
    );
  }
}

class Species {
  final String name;
  final String url;

  Species({
    required this.name,
    required this.url,
  });

  factory Species.fromJson(Map<String, dynamic> json) {
    return Species(
      name: json['name'],
      url: json['url'],
    );
  }
}

class Sprites {
  final String frontDefault;
  final String frontShiny;
  final String frontFemale;
  final String frontShinyFemale;
  final String backDefault;
  final String backShiny;
  final String backFemale;
  final String backShinyFemale;

  Sprites({
    required this.frontDefault,
    required this.frontShiny,
    required this.frontFemale,
    required this.frontShinyFemale,
    required this.backDefault,
    required this.backShiny,
    required this.backFemale,
    required this.backShinyFemale,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) {
    return Sprites(
      frontDefault: json['front_default'] ?? '',
      frontShiny: json['front_shiny'] ?? '',
      frontFemale: json['front_female'] ?? '',
      frontShinyFemale: json['front_shiny_female'] ?? '',
      backDefault: json['back_default'] ?? '',
      backShiny: json['back_shiny'] ?? '',
      backFemale: json['back_female'] ?? '',
      backShinyFemale: json['back_shiny_female'] ?? '',
    );
  }
}
