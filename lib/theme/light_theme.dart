import 'package:flutter/material.dart';
import 'package:sixvalley_delivery_boy/utill/color_resources.dart';
ThemeData light = ThemeData(
  fontFamily: 'Almarai',
  brightness: Brightness.light,
  hintColor: Colors.grey,
  shadowColor: const Color(0xfffcf9f4),
  primaryColor: const Color(0xFF804a9c),
  highlightColor: const Color(0xFF1F1F1F),
  focusColor: const Color(0xFF1F1F1F),
  dividerColor: const Color(0xFF2A2A2A),
  primaryColorDark: const Color(0xFFFFFFFF),
  colorScheme: const ColorScheme.light(primary: Color(0xFF804a9c), secondary: Color(0xFF804a9c),
      tertiary: Color(0xFFE5B92C),
    error: Color(0xFFFC6A57),
    tertiaryContainer: Color(0xFFADC9F3),
      onTertiaryContainer: Color(0xFF33AF74),
      outline: Color(0xFF039D55),
      surface: Color(0xFFEBD27D),
      surfaceTint: Color(0xFF004C8E),
      primaryContainer: Color(0xFF9AECC6),secondaryContainer: Color(0xFFF2F2F2),),

  textTheme:  const TextTheme(
    labelLarge: TextStyle(color: Colors.white),
    displayLarge: TextStyle(fontWeight: FontWeight.w300, color: ColorResources.colorBlack, ),
    displayMedium: TextStyle(fontWeight: FontWeight.w400, color: ColorResources.colorBlack, ),
    displaySmall: TextStyle(fontWeight: FontWeight.w500, color: ColorResources.colorBlack, ),
    headlineMedium: TextStyle(fontWeight: FontWeight.w600, color: ColorResources.colorBlack, ),
    headlineSmall: TextStyle(fontWeight: FontWeight.w700, color: ColorResources.colorBlack, ),
    bodySmall: TextStyle(fontWeight: FontWeight.w900, color: ColorResources.colorBlack,),
    titleMedium: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
    bodyMedium: TextStyle(fontSize: 12.0),
    bodyLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
  ),
);