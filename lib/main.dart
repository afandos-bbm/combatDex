import 'package:combatdex/mate_app.dart';
import 'package:flutter/material.dart';
import 'di.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  //  ErrorWidget.builder = (FlutterErrorDetails details) {
  //   return buildErrorPage(details);
  // };

  runApp(const MateApp());
}
