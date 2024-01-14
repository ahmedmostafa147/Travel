import 'package:dughri/theme/TextFontStyle.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  buttonTheme: ButtonThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  ),
  dividerTheme: const DividerThemeData(
    thickness: 1.0,
  ),
  fontFamily: TextFontStyle().getFontFamily(),
  useMaterial3: true,
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
);


