import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_me/core/theme/app_theme.dart';
import 'package:test_me/features/Login/view/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.getTheme(),
      home: LoginScreen(),
    );
  }
}
