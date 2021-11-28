import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_memory_card/constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Roboto",
    hintColor: kTextColor,
    focusColor: primaryColor,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    primaryColor: primaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: kTextColor, fontFamily: "Roboto"),
    bodyText2: TextStyle(color: kTextColor, fontFamily: "Roboto"),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w700,
      fontFamily: "Roboto",
    ),
  );
}
