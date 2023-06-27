import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tecresponde/src/provider/config_provider.dart';
import 'package:tecresponde/src/provider/tts_provider.dart';
import 'package:tecresponde/src/utils/transitions.dart';
import 'package:tecresponde/src/views/pages/config_page.dart';

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
    final ttsProvider = Provider.of<TTSProvider>(context);
    final configProvider = Provider.of<ConfigProvider>(context);
    Size mq = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TecResponde',
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Material(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              configProvider.cardStyle != 'Solo texto'
                                  ? Image.asset(
                                      'assets/images/afirmar_m.png',
                                      height:
                                          MediaQuery.of(context).size.height *
                                              8 *
                                              configProvider.factorSize!,
                                    )
                                  : const SizedBox.shrink(),
                              configProvider.cardStyle != 'Solo imagen'
                                  ? Text(
                                      'Si'.toUpperCase(),
                                      style: TextStyle(
                                          //fontSize: MediaQuery.of(context).size.height * 0.1,
                                          fontSize: orientation ==
                                                  Orientation.portrait
                                              ? mq.width *
                                                  3 *
                                                  configProvider.factorSize!
                                              : mq.height *
                                                  3 *
                                                  configProvider.factorSize!,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                        onTap: () {
                          HapticFeedback.lightImpact();
                          ttsProvider.speak(text: 'Sí');
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Material(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              configProvider.cardStyle != 'Solo texto'
                                  ? Image.asset(
                                      'assets/images/negar_m.png',
                                      height:
                                          MediaQuery.of(context).size.height *
                                              8 *
                                              configProvider.factorSize!,
                                    )
                                  : const SizedBox.shrink(),
                              configProvider.cardStyle != 'Solo imagen'
                                  ? Text(
                                      'No'.toUpperCase(),
                                      style: TextStyle(
                                          //fontSize: MediaQuery.of(context).size.height * 0.1,
                                          fontSize: orientation ==
                                                  Orientation.portrait
                                              ? mq.width *
                                                  3 *
                                                  configProvider.factorSize!
                                              : mq.height *
                                                  3 *
                                                  configProvider.factorSize!,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                        onTap: () {
                          HapticFeedback.lightImpact();
                          ttsProvider.speak(text: 'No');
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Material(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              configProvider.cardStyle != 'Solo texto'
                                  ? Image.asset(
                                      'assets/images/afirmar_m.png',
                                      height:
                                          MediaQuery.of(context).size.height *
                                              14 *
                                              configProvider.factorSize!,
                                    )
                                  : const SizedBox.shrink(),
                              configProvider.cardStyle != 'Solo imagen'
                                  ? Text(
                                      'Si'.toUpperCase(),
                                      style: TextStyle(
                                          //fontSize: MediaQuery.of(context).size.height * 0.2,
                                          fontSize: orientation ==
                                                  Orientation.portrait
                                              ? mq.width *
                                                  4 *
                                                  configProvider.factorSize!
                                              : mq.height *
                                                  4 *
                                                  configProvider.factorSize!,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                        onTap: () {
                          HapticFeedback.lightImpact();
                          ttsProvider.speak(text: 'Sí');
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Material(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              configProvider.cardStyle != 'Solo texto'
                                  ? Image.asset(
                                      'assets/images/negar_m.png',
                                      height:
                                          MediaQuery.of(context).size.height *
                                              14 *
                                              configProvider.factorSize!,
                                    )
                                  : const SizedBox.shrink(),
                              configProvider.cardStyle != 'Solo imagen'
                                  ? Text(
                                      'No'.toUpperCase(),
                                      style: TextStyle(
                                          //fontSize: MediaQuery.of(context).size.height * 0.2,
                                          fontSize: orientation ==
                                                  Orientation.portrait
                                              ? mq.width *
                                                  4 *
                                                  configProvider.factorSize!
                                              : mq.height *
                                                  4 *
                                                  configProvider.factorSize!,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                        onTap: () {
                          HapticFeedback.lightImpact();
                          ttsProvider.speak(text: 'No');
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
