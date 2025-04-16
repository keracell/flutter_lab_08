import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:lab_08_dubl3/screens/tabs_screen.dart';

// final textTheme = GoogleFonts.robotoTextTheme();
// final themeLight = ThemeData.dark().copyWith(
//   colorScheme: ColorScheme.fromSeed(
//     brightness: Brightness.dark,
//     seedColor: const Color.fromARGB(255, 131, 57, 0),
//   ),
//   textTheme: textTheme,
// );

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // darkTheme: ThemeData.dark().copyWith(),
      // theme: themeLight,
      // themeMode: ThemeMode.system,
      home: TabsScreen(),
    );
  }
}
