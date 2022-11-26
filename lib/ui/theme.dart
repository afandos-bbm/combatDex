import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getTheme(bool isDarkMode) => ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme().apply(
          displayColor: isDarkMode ? Colors.white : Colors.black,
          decorationColor: isDarkMode ? Colors.white : Colors.black,
          bodyColor: isDarkMode ? Colors.white : Colors.black),
      primarySwatch: Colors.red,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xFFD2092D),
          ),
          elevation: MaterialStateProperty.all<double>(10),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: const BorderSide(color: Colors.white, width: 2),
            ),
          ),
        ),
      ),
    );
