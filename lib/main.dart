import 'package:flutter/material.dart';
import 'package:wordpair_generator/utils/generateMaterialColor.dart';
import 'package:wordpair_generator/random_words.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:
            generateMaterialColor(const Color.fromARGB(255, 27, 47, 124)),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch:
            generateMaterialColor(const Color.fromARGB(255, 27, 47, 124)),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          color: Colors.grey[850],
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
        dividerColor: Colors.white24,
      ),
      themeMode: ThemeMode.system,
      home: const RandomWords(),
    );
  }
}
