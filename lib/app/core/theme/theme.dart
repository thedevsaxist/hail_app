import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'gen/colors.gen.dart';

class AppTheme {
  static ThemeData get standard {
    return ThemeData(
      // colorScheme: ColorScheme.fromSeed(seedColor: ColorName.primary),
      colorScheme: ColorScheme.fromSwatch(
        backgroundColor: ColorName.lightBackground,
        accentColor: ColorName.primary,
      ),
      fontFamily: GoogleFonts.poppins().fontFamily,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: ColorName.primary, brightness: Brightness.dark),
      // colorScheme: ColorScheme.dark(
      //   primary: ColorName.primary,
      //   surface: ColorName.darkBackground, 
      // ),
      fontFamily: GoogleFonts.poppins().fontFamily,
    );
  }
}
