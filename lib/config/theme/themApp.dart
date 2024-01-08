import 'package:flutter/material.dart';

import '../colors/colors.dart';

class Themes {
  ThemeData theme(int t) => t == 0
      ? ThemeData.light(
          useMaterial3: true,
        ).copyWith(
          appBarTheme: _appBar(t),
          textTheme: TextTheme(

            titleMedium: TextStyle(color: kTextColor[t],fontFamily: "Tajawal"),
            bodyLarge: TextStyle(color: kTextColor[t],fontFamily: "Tajawal"),
            bodyMedium: TextStyle(color: kTextColor[t],fontFamily: "Tajawal"),
            labelMedium: TextStyle(color: kTextColor[t],fontFamily: "Tajawal"),
          ),
          iconTheme: IconThemeData(color: kGroundColorIcon[t]),
          inputDecorationTheme: InputDecorationTheme(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            border: outlineInputBorder,
          ),
          expansionTileTheme: _expansionTile(t),
          scaffoldBackgroundColor: backGroundColor[t],
          visualDensity: VisualDensity.adaptivePlatformDensity,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: checkOutCartColor[t],
              foregroundColor: primaryColor[t],
              minimumSize: const Size(double.infinity, 48),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
          ),
          floatingActionButtonTheme: _floatingActionButton(t),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: backGroundColor[t]))
      : ThemeData.dark(useMaterial3: true).copyWith(
          appBarTheme: _appBar(t),
          iconTheme: IconThemeData(color: kGroundColorIcon[t]),
          textTheme: TextTheme(
            titleMedium: TextStyle(color: kTextColor[t],fontFamily: "Tajawal"),
            bodyLarge: TextStyle(color: kTextColor[t],fontFamily: "Tajawal"),
            bodyMedium: TextStyle(color: kTextColor[t],fontFamily: "Tajawal"),
            labelMedium: TextStyle(color: kTextColor[t],fontFamily: "Tajawal"),
          ),
          inputDecorationTheme: InputDecorationTheme(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            border: outlineInputBorder,
          ),
          expansionTileTheme: _expansionTile(t),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: primaryColor[t],
              foregroundColor: primaryColor[t],
              minimumSize: const Size(double.infinity, 48),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
          ),
          scaffoldBackgroundColor: backGroundColor[t],
          floatingActionButtonTheme: _floatingActionButton(t),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: backGroundColor[t]));

  AppBarTheme _appBar(int t) => AppBarTheme(
      backgroundColor: backGroundColor[t],
      iconTheme: IconThemeData(color: backGroundColorIcon[t]),
      elevation: 0,
      titleTextStyle: TextStyle(color: kTextColor[t]));

  FloatingActionButtonThemeData _floatingActionButton(int t) =>
      FloatingActionButtonThemeData(backgroundColor: primaryColor[t]);

  ExpansionTileThemeData _expansionTile(int t) => ExpansionTileThemeData(
        iconColor: primaryColor[t],
        collapsedIconColor: primaryColor[t],
        backgroundColor: foreGroundColor[t],
        collapsedBackgroundColor: foreGroundColor[t],
        collapsedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      );
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(28)),
    borderSide: BorderSide(color: kTextColor[0]),
    gapPadding: 10,
  );
}
