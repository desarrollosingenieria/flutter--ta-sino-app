import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasino/src/data/local/user_preferences.dart';
import 'package:tasino/src/provider/config_provider.dart';
import 'package:tasino/src/utils/transitions.dart';
import 'package:tasino/src/views/pages/config_page.dart';
import 'package:tasino/src/views/widgets/button_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserPreferences prefs = UserPreferences();
    final appConfig = ref.watch(configProvider);
    return Scaffold(
      backgroundColor: appConfig.highContrast ? Colors.black : Colors.white,
      appBar: MediaQuery.of(context).orientation == Orientation.portrait
          ? AppBar(
              title: const Text(
                'TA SiNo',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
            )
          : const PreferredSize(
              preferredSize: Size.zero,
              child: SafeArea(
                child: SizedBox.shrink(),
              )),
      body: MediaQuery.of(context).orientation == Orientation.portrait
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                    image: 'assets/images/afirmar_m.png',
                    text: 'Sí',
                    color: prefs.highContrast ? Colors.yellow : Colors.green),
                ButtonWidget(
                  image: 'assets/images/negar_m.png',
                  text: 'No',
                  color: prefs.highContrast ? Colors.purple : Colors.red,
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ButtonWidget(
                    image: 'assets/images/afirmar_m.png',
                    text: 'Sí',
                    color: prefs.highContrast ? Colors.yellow : Colors.green),
                ButtonWidget(
                  image: 'assets/images/negar_m.png',
                  text: 'No',
                  color: prefs.highContrast ? Colors.purple : Colors.red,
                ),
              ],
            ),
    );
  }
}
