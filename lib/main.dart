import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tecresponde/src/app.dart';
import 'package:tecresponde/src/data/local/user_preferences.dart';
import 'package:tecresponde/src/provider/config_provider.dart';
import 'package:tecresponde/src/provider/tts_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // orientacion vertical
  //await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // statusbar transparente
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  final prefs = UserPreferences();
  await prefs.initPrefs();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => TTSProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => ConfigProvider(),
        ),
      ],
      child: const TecResponde(),
    ),
  );
}
