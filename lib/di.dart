import 'package:combatdex/domain/services/theme_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt _l = GetIt.instance;

Future<void> init() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  _l.registerSingleton<SharedPreferences>(prefs);

    bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
  _l.registerSingleton<ThemeService>(ThemeService(darkMode: isDarkMode));


  return Future.value();
}
