import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.deepPurple,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.light),
  useMaterial3: true,
  textTheme: const TextTheme(
    headlineMedium: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Colors.black),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.deepPurple,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark),
  useMaterial3: true,
  textTheme: const TextTheme(
    headlineMedium: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
  ),
);
