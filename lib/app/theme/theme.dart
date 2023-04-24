// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData();
  
  return base.copyWith(
    primaryColor            : const Color.fromRGBO(252, 67, 68, 1),
    scaffoldBackgroundColor : const Color.fromRGBO(242, 246, 255, 1),
    backgroundColor         : const Color.fromRGBO(241, 242, 245, 1),

    cardTheme: CardTheme(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 3),
      color: const Color.fromRGBO(35, 43, 56, 1),
      shape: RoundedRectangleBorder(  borderRadius: BorderRadius.circular(15.0)),
    ),

    inputDecorationTheme: InputDecorationTheme(
      fillColor:  const Color.fromRGBO(231, 233, 242, 1),
      labelStyle: const TextStyle( color: Colors.white),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        borderSide: BorderSide(color: Color.fromRGBO(0, 127, 145, .2))
      ),
      focusColor: Colors.black,
      filled: true,
      border: OutlineInputBorder( borderRadius: BorderRadius.circular(15)),
      enabledBorder:  OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
        borderRadius: BorderRadius.circular(15)
      ),
    ),

    buttonTheme: const ButtonThemeData(
      buttonColor   : Color.fromRGBO(19, 25, 41, 1),
      highlightColor: Color.fromRGBO(9, 117, 122, 1),
      splashColor   : Color.fromRGBO(9, 117, 122, 1),
      focusColor    : Color.fromRGBO(9, 117, 122, 1),
      height: 55.0, 
    ),

    dialogTheme: const DialogTheme(
      backgroundColor: Color.fromRGBO(0, 82, 102, 1),
      contentTextStyle: TextStyle(color: Colors.white)
    ),
    // textSelectionColor: Colors.white,
    textSelectionTheme: const TextSelectionThemeData(selectionColor: Colors.white),


    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 25, color: Color.fromRGBO(19, 25, 41, 1), fontFamily: 'Poppins',    ),
      headline2: TextStyle(fontSize: 25, color: Color.fromRGBO(19, 25, 41, 1), fontFamily: 'PoppinsMedium'),
      headline3: TextStyle(fontSize: 25, color: Color.fromRGBO(19, 25, 41, 1), fontFamily: 'PoppinsBold'),
      headline4: TextStyle(fontSize: 17, color: Color.fromRGBO(19, 25, 41, 1), fontFamily: 'Poppins'),
      headline5: TextStyle(fontSize: 14, color: Color.fromRGBO(19, 25, 41, 1), fontFamily: 'PoppinsMedium'),
      headline6: TextStyle(fontSize: 13, color: Color.fromRGBO(19, 25, 41, 1), fontFamily: 'Poppins'),
      bodyText1: TextStyle(fontSize: 15, color: Color.fromRGBO(19, 25, 41, 1), fontFamily: 'PoppinsMedium' ),
      bodyText2: TextStyle(fontSize: 15, color: Color.fromRGBO(19, 25, 41, 1), fontFamily: 'Poppins'),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Color.fromRGBO(0, 127, 145, 1)
    )
  );
}

ThemeData darkTheme() {
  final ThemeData base = ThemeData();
  
  return base.copyWith(
    primaryColor            : const Color.fromRGBO(252, 67, 68, 1),

    scaffoldBackgroundColor : const Color.fromRGBO(31, 35, 65, 1),
    backgroundColor         : const Color.fromRGBO(44, 44, 80, 1),

    cardTheme: CardTheme(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 3),
      color: const Color.fromRGBO(35, 43, 56, 1),
      shape: RoundedRectangleBorder(  borderRadius: BorderRadius.circular(15.0)),
    ),

    inputDecorationTheme: InputDecorationTheme(
      fillColor:  const Color.fromRGBO(231, 233, 242, 1),
      labelStyle: const TextStyle( color: Colors.white),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        borderSide: BorderSide(color: Color.fromRGBO(0, 127, 145, .2))
      ),
      focusColor: Colors.black,
      filled: true,
      border: OutlineInputBorder( borderRadius: BorderRadius.circular(15)),
      enabledBorder:  OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
        borderRadius: BorderRadius.circular(15)
      ),
    ),

    buttonTheme: const ButtonThemeData(
      buttonColor   : Color.fromRGBO(19, 25, 41, 1),
      highlightColor: Color.fromRGBO(9, 117, 122, 1),
      splashColor   : Color.fromRGBO(9, 117, 122, 1),
      focusColor    : Color.fromRGBO(9, 117, 122, 1),
      height: 55.0, 
    ),

    dialogTheme: const DialogTheme(
      backgroundColor: Color.fromRGBO(0, 82, 102, 1),
      contentTextStyle: TextStyle(color: Colors.white)
    ),
    // textSelectionColor: Colors.white,
    textSelectionTheme: const TextSelectionThemeData(selectionColor: Colors.white),


    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 25, color: Colors.white, fontFamily: 'Poppins',    ),
      headline2: TextStyle(fontSize: 25, color: Colors.white, fontFamily: 'PoppinsMedium'),
      headline3: TextStyle(fontSize: 25, color: Colors.white, fontFamily: 'PoppinsBold'),
      headline4: TextStyle(fontSize: 17, color: Colors.white, fontFamily: 'Poppins'),
      headline5: TextStyle(fontSize: 14, color: Colors.white, fontFamily: 'PoppinsMedium'),
      headline6: TextStyle(fontSize: 13, color: Colors.white, fontFamily: 'Poppins'),
      bodyText1: TextStyle(fontSize: 15, color: Colors.white, fontFamily: 'PoppinsMedium' ),
      bodyText2: TextStyle(fontSize: 15, color: Colors.white, fontFamily: 'Poppins'),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Color.fromRGBO(0, 127, 145, 1)
    )
  );
}