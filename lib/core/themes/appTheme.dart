import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData _main = ThemeData.light();
  static ThemeData get light {
    return _main.copyWith(
      primaryColor: Color(0xffffffff),
      accentColor: Color(0xff212121),
      backgroundColor: Color(0xff121212),
      textTheme: TextTheme(
        headline4: TextStyle(
          color: Colors.white
        ),
        subtitle2: TextStyle(
          color: Colors.grey[500]
        )
      )
    );
  }
}