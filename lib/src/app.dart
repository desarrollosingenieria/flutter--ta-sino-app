import 'package:tasino/src/voice/presentation/views/screens/home_screen.dart';
import 'package:flutter/material.dart';

class TASino extends StatelessWidget {
  const TASino({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TA SiNo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
