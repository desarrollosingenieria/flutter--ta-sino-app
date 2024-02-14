import 'package:flutter/material.dart';
import 'package:tasino/src/views/pages/home_page.dart';

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
      home: const HomePage(),
    );
  }
}
