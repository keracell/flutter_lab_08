import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lab_08_meals/screens/categories_screen.dart';

final textTheme = GoogleFonts.robotoTextTheme();
final themeLight = ThemeData.dark().copyWith(
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
      body: const CategoriesScreen(),
    ),
  ));
}
