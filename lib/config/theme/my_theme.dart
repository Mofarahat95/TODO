import 'package:flutter/material.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/core/utils/styles_manager.dart';
import 'package:todo/core/utils/values_manager.dart';

class MyTheme {
  static ThemeData lihgt = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      titleTextStyle: poppins22(),
    ),
    scaffoldBackgroundColor: AppColors.bgLigthColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: AppColors.transparentColor,
        type: BottomNavigationBarType.shifting,
        showSelectedLabels: true),
    iconTheme: IconThemeData(
      size: 60,
      color: AppColors.iconColor,
    ),
    iconButtonTheme: IconButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            fixedSize: Size(70, 35),
            iconColor: AppColors.whiteColor,
            iconSize: 30)),

    dividerTheme: DividerThemeData(
      color: AppColors.primaryColor,
      thickness: 5,
      endIndent: 22,
      indent: 22,
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      iconSize: AppSize.s26,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(
            width: 4,
            color: AppColors.whiteColor,
          )),
      backgroundColor: AppColors.primaryColor,
    ),
  );

  static ThemeData dark = ThemeData();
}
