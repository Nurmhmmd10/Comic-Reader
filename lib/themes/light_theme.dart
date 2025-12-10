import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  textTheme: GoogleFonts.poppinsTextTheme(),
  appBarTheme: const AppBarTheme(centerTitle: true),
);