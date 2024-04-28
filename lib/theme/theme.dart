import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    primary: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600)),
  useMaterial3: true,
);
