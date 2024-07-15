import 'package:flutter/material.dart';

Size getSizeScreen(BuildContext context) {
  return MediaQuery.of(context).size;
}

Orientation getOrientationScreen(BuildContext context) {
  return MediaQuery.of(context).orientation;
}
