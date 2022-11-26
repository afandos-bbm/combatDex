import 'package:combatdex/domain/entities/pokemon.dart';
import 'package:combatdex/domain/services/api_conector.dart';
import 'package:flutter/material.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon List'),
      ),
      body: FutureBuilder<List<Pokemon>>(
          future: getPokemons(),
          builder: (context, snapshot) {
            return Center(
                child: Column(
              children: [
                if (snapshot.hasData)
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data![index].name),
                        );
                      },
                    ),
                  )
                else
                  const CircularProgressIndicator(),
              ],
            ));
          }),
    );
  }

  Future<List<Pokemon>> getPokemons() async {
    RequestResult response = await httpGet('/pokemon');

    if (response.ok == true) {
      List<Pokemon> pokemons = [];
      for (var pokemon in response.data['results']) {
        pokemons.add(Pokemon.fromJson(pokemon));
      }
      return pokemons;
    } else {
      throw Exception('Failed to load pokemons');
    }
  }
}
