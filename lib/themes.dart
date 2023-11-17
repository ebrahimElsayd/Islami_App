import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static const Color primary = Color(0x71b7935f);
  static const Color blackColor = Color(0xFF242424);

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: blackColor, size: 30),
          color: Colors.transparent,
          elevation: 0.0,
          centerTitle: true),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.elMessiri(
            fontSize: 30, color: blackColor, fontWeight: FontWeight.bold),
        bodySmall: GoogleFonts.elMessiri(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
        bodyMedium: GoogleFonts.elMessiri(
            fontSize: 25, color: Colors.black, fontWeight: FontWeight.w500),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: primary,
        selectedItemColor: blackColor,
        unselectedItemColor: Colors.white,
      ));
  static ThemeData darkTheme = ThemeData();
}
