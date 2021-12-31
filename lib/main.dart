import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_me/core/theme/app_theme.dart';
import 'package:test_me/features/Login/view/screens/login_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/icons/medicos.png"), context);
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.getTheme(),
        home: LoginScreen(),
      ),
    );
  }
}
