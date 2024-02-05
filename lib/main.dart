import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tasino/src/app.dart';
import 'package:tasino/src/data/local/user_preferences.dart';
import 'package:tasino/src/provider/config_provider.dart';
import 'package:tasino/src/provider/tts_provider.dart';
import 'package:tasino/src/utils/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Bloqueo de orientacion para pantallas chicas
  //await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  if(getDeviceType() == 'phone'){    
             SystemChrome.setPreferredOrientations([
                DeviceOrientation. portraitUp,
             ]);    
        }    
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
      child: const TASino(),
    ),
  );
}
