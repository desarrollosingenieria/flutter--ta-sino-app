import 'package:tasino/core/utils/transitions.dart';
import 'package:tasino/src/customisation/presentation/provider/customisation_controller.dart';
import 'package:tasino/src/customisation/presentation/views/screens/config_screen.dart';
import 'package:tasino/src/voice/presentation/views/widgets/basic_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appParameters = ref.watch(customisationControllerProvider);
    return Scaffold(
      backgroundColor: appParameters.highContrast ? Colors.black : Colors.white,
      appBar: AppBar(
        title: const Text(
          'Basic COM',
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
                  widget: const ConfigScreen(),
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
                BasicButtonWidget(
                    image: 'assets/images/afirmar_m.png',
                    text: 'Sí',
                    color: appParameters.highContrast
                        ? Colors.yellow
                        : Colors.green),
                BasicButtonWidget(
                  image: 'assets/images/negar_m.png',
                  text: 'No',
                  color:
                      appParameters.highContrast ? Colors.purple : Colors.red,
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BasicButtonWidget(
                    image: 'assets/images/afirmar_m.png',
                    text: 'Sí',
                    color: appParameters.highContrast
                        ? Colors.yellow
                        : Colors.green),
                BasicButtonWidget(
                  image: 'assets/images/negar_m.png',
                  text: 'No',
                  color:
                      appParameters.highContrast ? Colors.purple : Colors.red,
                ),
              ],
            ),
    );
  }
}
