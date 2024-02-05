import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tasino/src/data/local/user_preferences.dart';
import 'package:tasino/src/provider/config_provider.dart';
import 'package:tasino/src/provider/tts_provider.dart';

class ButtonWidget extends StatelessWidget {
  final String image, text;
  final Color color;
  const ButtonWidget({super.key, required this.image, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    final ttsProvider = Provider.of<TTSProvider>(context);
    final configProvider = Provider.of<ConfigProvider>(context);
    Size mq = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    final UserPreferences prefs = UserPreferences();
    return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Material(
                      color: color,
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
                                      image,
                                      height: configProvider.cardStyle ==
                                              "Solo imagen"
                                          ? MediaQuery.of(context).size.width *
                                              0.5 
                                          : MediaQuery.of(context).size.width *
                                              0.4  ,
                                    )
                                  : const SizedBox.shrink(),
                              configProvider.cardStyle != 'Solo imagen'
                                  ? Text(
                                      text.toUpperCase(),
                                      style: TextStyle(
                                          //fontSize: MediaQuery.of(context).size.height * 0.1,
                                          fontSize: configProvider.cardStyle ==
                                              "Solo texto"
                                          ? orientation ==
                                                  Orientation.portrait
                                              ? mq.width *
                                                  0.3 
                                              : mq.height *
                                                  0.3 
                                          : orientation ==
                                                  Orientation.portrait
                                              ? mq.width *
                                                  0.14 
                                              : mq.height *
                                                  0.1,
                                          fontWeight: FontWeight.bold,
                                          color: prefs.highContrast ? Colors.black : Colors.white),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                        onTap: () {
                          HapticFeedback.lightImpact();
                          ttsProvider.speak(text: text);
                        },
                      ),
                    ),
                  ),
                );
  }
}