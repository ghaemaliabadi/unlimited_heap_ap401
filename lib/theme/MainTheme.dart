import 'package:flutter/material.dart';

ThemeData buildThemeData() {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.green[500],
      secondary: Colors.grey[300],
    ),
    // primarySwatch: Color.green,
    // accentColor: Colors.greenAccent,
    fontFamily: 'kalameh',
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      headline2: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      headline3: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      headline4: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      headline5: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      // signup page: navigate to login page
      headline6: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        decoration: TextDecoration.underline,
      ),
      bodyText1: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w300,
        color: Colors.black,
      ),
      bodyText2: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w300,
        color: Colors.black,
      ),
    ),
  );
}