import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorConstants {
  static const Color black = Colors.black;
  static const Color white = Colors.white;
}

class FontConstants {
  static String robotoFont = GoogleFonts.roboto().fontFamily!;
  static String nunitoFont = GoogleFonts.nunito().fontFamily!;
}

class TextStyleConstants {
  static TextStyle textStyleSmall = TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 16,
  );

  static TextStyle textStyleLarge = TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 24,
  );
}
