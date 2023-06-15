import 'package:flutter/material.dart';

const Color _baseColor = Color(0xFF1E3486);

const List<Color> _colorThemes = [
  _baseColor,
  Colors.orange,
  Colors.indigo,
  Colors.teal,
  Colors.pink
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'Colors must be between and ${_colorThemes.length - 1}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colorThemes[selectedColor]);
  }
}
