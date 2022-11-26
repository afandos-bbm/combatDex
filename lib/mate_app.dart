import 'package:combatdex/domain/services/theme_service.dart';
import 'package:combatdex/ui/home_page.dart';
import 'package:combatdex/ui/pokemon_list/pokemon_list_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MateApp extends StatefulWidget {
  const MateApp({super.key});

  @override
  State<MateApp> createState() => _MateAppState();
}

class _MateAppState extends State<MateApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CombatDex - Combat Pokedex',
      theme: GetIt.I<ThemeService>().theme,
      routes: {
        '/pokemon': (context) => const PokemonListPage(),
        '/combat': (context) => const HomePage(),
        '/settings': (context) => const HomePage(),
        '/my-account': (context) => const HomePage(),
      },
      home: const HomePage(),
    );
  }

  @override
  void initState() {
    super.initState();
    GetIt.I<ThemeService>().addListener(() {
      setState(() {});
    });
  }
}
