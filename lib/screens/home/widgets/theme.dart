import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class MyThemes {
  static final lightTheme = ThemeData(

    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
        bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    )),
    appBarTheme: AppBarTheme(
        actionsIconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 20.0,
        selectedItemColor: Colors.green,
        type: BottomNavigationBarType.fixed),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Colors.green),
    iconTheme: IconThemeData(color: Colors.black),
  );

  static final darkTheme = ThemeData(

    textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.white, fontWeight: FontWeight.w600,fontSize: 20)),
    primarySwatch: Colors.green,
    appBarTheme: AppBarTheme(
        actionsIconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        backgroundColor: HexColor('333739'),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('333739'),
          statusBarIconBrightness: Brightness.light,
        )),
    iconTheme: IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: HexColor('333739'),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 20.0,
        unselectedItemColor: Colors.grey,
        backgroundColor: HexColor('333739'),
        selectedItemColor: Colors.green,
        type: BottomNavigationBarType.fixed),
  );
}


