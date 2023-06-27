import 'package:flutter/material.dart';
import 'package:tecresponde/src/views/pages/home_page.dart';

class TecResponde extends StatelessWidget {
  const TecResponde({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TecResponde',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
