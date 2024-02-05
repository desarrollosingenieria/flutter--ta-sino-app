import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasino/src/data/local/user_preferences.dart';
import 'package:tasino/src/provider/config_provider.dart';
import 'package:tasino/src/provider/tts_provider.dart';
import 'package:tasino/src/utils/transitions.dart';
import 'package:tasino/src/views/pages/config_page.dart';
import 'package:tasino/src/views/widgets/button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final ttsProvider = Provider.of<TTSProvider>(context, listen: false);
    ttsProvider.initLanguages();
    final configProvider = Provider.of<ConfigProvider>(context, listen: false);
    configProvider.initConfig();
  }

  @override
  Widget build(BuildContext context) {
    final UserPreferences prefs = UserPreferences();
    final configProvider = Provider.of<ConfigProvider>(context);
    return Scaffold(
      backgroundColor: configProvider.highContrast! ? Colors.black : Colors.white,
      appBar: AppBar(
        title: const Text(
          'TA Si/No',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF003A70),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                FadeTransitionRoute(
                  widget: const ConfigPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: MediaQuery.of(context).orientation == Orientation.portrait
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(image: 'assets/images/afirmar_m.png', text: 'Sí', color: prefs.highContrast ? Colors.yellow : Colors.green),
                ButtonWidget(image: 'assets/images/negar_m.png', text: 'No', color: prefs.highContrast ?  Colors.purple : Colors.red,),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ButtonWidget(image: 'assets/images/afirmar_m.png', text: 'Sí', color: prefs.highContrast ? Colors.yellow : Colors.green),
                ButtonWidget(image: 'assets/images/negar_m.png', text: 'No', color: prefs.highContrast ?  Colors.purple : Colors.red,),
              ],
            ),
    );
  }
}
