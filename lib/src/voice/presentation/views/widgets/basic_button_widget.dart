import 'package:tasino/src/customisation/presentation/provider/customisation_controller.dart';
import 'package:tasino/src/voice/presentation/provider/voice_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasicButtonWidget extends ConsumerWidget {
  final String image, text;
  final Color color;
  const BasicButtonWidget(
      {super.key,
      required this.image,
      required this.text,
      required this.color});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appParameters = ref.watch(customisationControllerProvider);
    Size mq = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
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
                  appParameters.cardStyle != 'Solo texto'
                      ? Image.asset(
                          image,
                          height: appParameters.cardStyle == "Solo imagen"
                              ? orientation == Orientation.portrait
                                  ? mq.width * 0.6
                                  : mq.width * 0.4
                              : orientation == Orientation.portrait
                                  ? mq.width * 0.6
                                  : mq.width * 0.2,
                        )
                      : const SizedBox.shrink(),
                  appParameters.cardStyle != 'Solo imagen'
                      ? Text(
                          text.toUpperCase(),
                          style: TextStyle(
                              fontSize: appParameters.cardStyle == "Solo texto"
                                  ? orientation == Orientation.portrait
                                      ? mq.width * appParameters.factorSize * 4
                                      : mq.height * appParameters.factorSize * 8
                                  : orientation == Orientation.portrait
                                      ? mq.width * appParameters.factorSize * 2
                                      : mq.width *
                                          appParameters.factorSize *
                                          1.2,
                              fontWeight: FontWeight.bold,
                              color: appParameters.highContrast
                                  ? Colors.black
                                  : Colors.white),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
            onTap: () {
              HapticFeedback.lightImpact();
              ref.read(voiceControllerProvider.notifier).speak(text: text);
            },
          ),
        ),
      ),
    );
  }
}
