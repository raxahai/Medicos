import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFF64d5ed);
  static const Color secondaryColor = Color(0xFF587ae0);

  static const Color maroonRedColor = Color(0xFFff2e2e);
  static const Color circleAvatarColor = Color(0xFFA4B2CC);
  static Color blackBorderColor = Colors.black;
  static const Color blueColor = Colors.blueAccent;

  static TextTheme _buildTextTheme(TextTheme base) {
    var fontName = 'Roboto';
    return base.copyWith(
      headline6: base.headline6!.copyWith(fontFamily: fontName),
      headline5: base.headline5!.copyWith(fontFamily: fontName),
      headline4: base.headline4!.copyWith(fontFamily: fontName),
      headline3: base.headline3!.copyWith(fontFamily: fontName),
      headline2: base.headline2!.copyWith(fontFamily: fontName),
      headline1: base.headline1!.copyWith(fontFamily: fontName),
      bodyText2: base.bodyText2!.copyWith(fontFamily: fontName),
      bodyText1: base.bodyText1!.copyWith(fontFamily: fontName),
      subtitle2: base.subtitle2!.copyWith(fontFamily: fontName),
      subtitle1: base.subtitle1!.copyWith(fontFamily: fontName),
      button: base.button!.copyWith(fontFamily: fontName),
    );
  }

  static ThemeData getTheme() {
    return newLightTheme();
  }

  static ThemeData newLightTheme() {
    // Color primaryColor = primaryColor;
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      buttonColor: Color(0XFFff2e2e),
      indicatorColor: Colors.white,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      accentColor: secondaryColor,
      canvasColor: Colors.white,
      backgroundColor: const Color(0xFFF7F9FC),
      scaffoldBackgroundColor: const Color(0xFFF7F9FC),
      errorColor: const Color(0xFFB00020),
      iconTheme: IconThemeData(color: maroonRedColor, size: 30),
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ElevatedButton.styleFrom(
      //     primary: secondaryColor,
      //   ),
      // ),
      // buttonTheme: ButtonThemeData(
      //   colorScheme: ColorScheme.light().copyWith(
      //     primary: Colors.red,
      //     secondary: Color(0xFFba030f),
      //   ),
      //   textTheme: ButtonTextTheme.primary,
      // ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(15.0),
        border: _customOutlinedButton(blackBorderColor),
        enabledBorder: _customOutlinedButton(blackBorderColor),
        focusedBorder: _customOutlinedButton(secondaryColor),
        // hintStyle: TextStyle(
        //   color: blackBorderColor,
        // ),
      ),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
    );
  }

  static OutlineInputBorder _customOutlinedButton(Color borderSideColor) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(6.0),
      ),
      borderSide: BorderSide(color: borderSideColor, width: 0.8),
    );
  }
}
