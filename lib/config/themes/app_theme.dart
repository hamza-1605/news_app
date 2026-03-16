import 'package:flutter/material.dart';

ThemeData appTheme(){
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,

    appBarTheme: AppBarThemeData(
      foregroundColor: Colors.black,
      backgroundColor: Colors.yellowAccent,
      titleTextStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w800,
        color: Colors.black
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black87),
      elevation: 10,
    ),

    listTileTheme: ListTileThemeData(
      shape: BeveledRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
    ),
  );
}