import 'package:tasino/core/constants/constants.dart';
import 'package:tasino/src/customisation/presentation/provider/customisation_controller.dart';
import 'package:tasino/src/voice/presentation/provider/voice_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VoiceButtonWidget extends ConsumerWidget {
  const VoiceButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appParameters = ref.watch(customisationControllerProvider);
    final Orientation orientation = MediaQuery.of(context).orientation;
    final Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      child: Material(
        borderRadius: BorderRadius.circular(16),
        color: appParameters.highContrast ? Colors.white : Colors.blue,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            alignment: Alignment.center,
            width: orientation == Orientation.portrait
                ? size.width * 0.6
                : size.height * 0.6,
            height: orientation == Orientation.portrait
                ? size.width * 0.2
                : size.height * 0.2,
            child: Text(
              TEST_VOICE_BUTTON,
              style: TextStyle(
                fontSize: orientation == Orientation.portrait
                    ? size.width * 0.68 * appParameters.factorSize
                    : size.height * 0.68 * appParameters.factorSize,
                fontWeight: FontWeight.bold,
                color: appParameters.highContrast ? Colors.black : Colors.white,
              ),
            ),
          ),
          onTap: () {
            ref
                .read(voiceControllerProvider.notifier)
                .speak(text: TEST_VOICE_TEXT);
          },
        ),
      ),
    );
  }
}
