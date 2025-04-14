import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final textTheme = GoogleFonts.latoTextTheme();
final themeLight = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: textTheme,
);

void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(),
    theme: themeLight,
    themeMode: ThemeMode.system,
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Meals App'),
      ),
      body: const Center(
        child: Text('ultra'),
      ),
    ),
  ));
}
