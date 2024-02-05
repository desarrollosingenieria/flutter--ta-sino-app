import 'package:flutter/material.dart';
import 'package:tasino/src/constants/constants.dart';
import 'package:tasino/src/data/local/user_preferences.dart';

class ConfigProvider with ChangeNotifier {
  final prefs = UserPreferences();
  double? _factorSize;
  String? _factorText;
  String? _cardStyle;
  bool? _highContrast;

  void initConfig() {
    _factorSize = prefs.factorSize;
    _factorText = prefs.factorText;
    _cardStyle = prefs.cardStyle;
    _highContrast = prefs.highContrast;
  }

  void setFactorSize(double size, String factorText) {
    
    if (factorText == 'grande') {
      prefs.factorText = 'grande';
      _factorText = 'grande';
      prefs.factorSize = size > MEDIUM_SCREEN_SIZE ? 0.04 : 0.08;
      _factorSize = size > MEDIUM_SCREEN_SIZE ? 0.04 : 0.08;
    } else if (factorText == 'predeterminado') {
      prefs.factorText = 'predeterminado';
      _factorText = 'predeterminado';
      prefs.factorSize = size > MEDIUM_SCREEN_SIZE ? 0.036 : 0.06;
      _factorSize = size > MEDIUM_SCREEN_SIZE ? 0.036 : 0.06;
    } else {
      prefs.factorText = 'pequeño';
      prefs.factorSize = size > MEDIUM_SCREEN_SIZE ? 0.03 : 0.054;
      _factorSize = size > MEDIUM_SCREEN_SIZE ? 0.03 : 0.054;
      _factorText = 'pequeño';
    }

    notifyListeners();
  }

  void setCardStyle(String cardStyle) {
    prefs.cardStyle = cardStyle;
    _cardStyle = cardStyle;
    notifyListeners();
  }

  void setHighContrast(bool status) {
    _highContrast = status;
    prefs.highContrast = status;
    notifyListeners();
  }

  double? get factorSize => _factorSize;
  String? get factorText => _factorText;
  String? get cardStyle => _cardStyle;
  bool? get highContrast => _highContrast ?? false;
}
