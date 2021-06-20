import 'package:clone_epoint/const/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// [isDarkMode] hiện tại để 2 Theme dark và light
ThemeData getThemeApp({bool isDarkMode = false}) {
  ThemeData base = isDarkMode ? ThemeData.dark() : ThemeData.light();

  //Config theme
  TextTheme _basicTextTheme() {
    final TextTheme _textTheme = base.textTheme;

    return base.textTheme.copyWith(
      // headline
      headline1: _textTheme.headline1.copyWith(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: AppColors.textColorTheme(isDarkMode)),
      headline2: _textTheme.headline2.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.textColorTheme(isDarkMode)),
      headline3: _textTheme.headline3.copyWith(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: AppColors.textColorTheme(isDarkMode)),
      headline4: _textTheme.headline4.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.textColorTheme(isDarkMode)),
      headline5: _textTheme.headline5
          .copyWith(fontSize: 22, color: AppColors.textColorTheme(isDarkMode)),
      headline6: _textTheme.headline6
          .copyWith(fontSize: 20, color: AppColors.textColorTheme(isDarkMode)),
      // subtitle
      subtitle1: _textTheme.subtitle1
          .copyWith(fontSize: 14, color: AppColors.textColorTheme(isDarkMode)),
      subtitle2: _textTheme.subtitle2
          .copyWith(fontSize: 14, color: AppColors.subTextColor(isDarkMode)),
      // body
      bodyText1: _textTheme.bodyText1
          .copyWith(fontSize: 16, color: AppColors.textColorTheme(isDarkMode)),
      bodyText2: _textTheme.bodyText2
          .copyWith(fontSize: 16, color: AppColors.subTextColor(isDarkMode)),
      // caption - chú thích trong app
      caption: _textTheme.caption
          .copyWith(fontSize: 12, color: AppColors.textColorTheme(isDarkMode)),
      // button
      button: _textTheme.button
          .copyWith(fontSize: 14, color: AppColors.textColorTheme(isDarkMode)),
    );
  }

  IconThemeData _buildIconTheme() => base.iconTheme.copyWith(
        color: isDarkMode ? Colors.white : Colors.black,
        size: 20.0,
      );

  AppBarTheme _buildAppBarTheme() => base.appBarTheme.copyWith(
      elevation: 0.0,
      brightness: isDarkMode ? Brightness.light : Brightness.dark,
      color: isDarkMode ? Color(0xFF02031b) : Color(0xF0F0F0F0),
      iconTheme: _buildIconTheme());

  ButtonThemeData _buildButtonTheme() => base.buttonTheme.copyWith(
      height: 50,
      minWidth:
          5, // Them vao de context menu copy, paste tren Samsung khong bi soc vang
      buttonColor: AppColors.bgColorChoosed,
      textTheme: ButtonTextTheme.accent,
      colorScheme: base.colorScheme
          .copyWith(primary: Colors.white, secondary: Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ));

  TextButtonThemeData _textButtonThemeData() => TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(base.textTheme.bodyText1),
          overlayColor: MaterialStateProperty.all(Colors.white38),
        ),
      );

  BottomAppBarTheme _buildBottomAppBarTheme() =>
      base.bottomAppBarTheme.copyWith(color: Colors.transparent);

  BottomSheetThemeData _buildBottomSheetTheme() =>
      base.bottomSheetTheme.copyWith(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
      );

  DialogTheme _buildDialogTheme() => base.dialogTheme.copyWith(
        backgroundColor: Colors.white,
        titleTextStyle:
            Get.textTheme.headline4.copyWith(color: AppColors.textBlue),
        contentTextStyle: Get.textTheme.bodyText2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
      );

  CardTheme _buildCardTheme() => base.cardTheme
      .copyWith(color: AppColors.primaryColorTheme(isDarkMode), elevation: 0.0);

  return base.copyWith(
    // themes
    textTheme: _basicTextTheme(),
    iconTheme: _buildIconTheme(),
    appBarTheme: _buildAppBarTheme(),
    bottomAppBarTheme: _buildBottomAppBarTheme(),
    bottomSheetTheme: _buildBottomSheetTheme(),
    tabBarTheme: base.tabBarTheme.copyWith(
      labelColor: AppColors.primaryColorTheme(isDarkMode),
      unselectedLabelColor: AppColors.primaryColorTheme(isDarkMode),
    ),
    buttonTheme: _buildButtonTheme(),
    cardTheme: _buildCardTheme(),

    // colors
    primaryColor: AppColors.primaryColorTheme(isDarkMode),
    indicatorColor: Colors.grey,
    textButtonTheme: _textButtonThemeData(),
    scaffoldBackgroundColor: isDarkMode ? Color(0xFF0b0725) : Color(0xF0F0F0F0),
    accentColor: Colors.orange,
    dialogTheme: _buildDialogTheme(),
  );
  // buttonColor: AppColors.buttonColor,
  // cardColor: isDarkMode ? AppColors.cardColor : Colors.pink[50],
  // secondaryHeaderColor: isDarkMode ? AppColors.buttonColor2 : Colors.grey,
  // backgroundColor: isDarkMode ? AppColors.backgroundColor : Colors.white,
  // dialogBackgroundColor: AppColors.darkPrimaryColor);
}
