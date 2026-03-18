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
      elevation: 0,
      scrolledUnderElevation: 0,
    ),

    listTileTheme: ListTileThemeData(
      shape: BeveledRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.yellowAccent,
      foregroundColor: Colors.black
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        iconSize: 20.0,
        shape: CircleBorder(),
        padding: EdgeInsets.all(5.0),
        backgroundColor: Colors.red[700],
        foregroundColor: Colors.white,
      ),
    )
  );
}