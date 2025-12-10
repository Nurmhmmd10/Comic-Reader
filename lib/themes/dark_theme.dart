import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  textTheme: GoogleFonts.poppinsTextTheme(ThemeData(brightness: Brightness.dark).textTheme),
  appBarTheme: const AppBarTheme(centerTitle: true),
);