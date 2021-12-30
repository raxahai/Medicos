import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_me/features/Home/view/screens/home_screen.dart';
import 'package:test_me/features/Login/repository/login_repository.dart';
import 'package:test_me/features/Login/service/local_data_service.dart';

class LoginViewModelImpl extends GetxController {
  // LoginRepository loginRepository = LoginRepositoryImpl(
  //     localDataSource: LoginLocalDataServiceImplementation(
  //         sharedPreference: SharedPreferences()));
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login() async {
    if (formKey.currentState!.validate()) {
      await Get.to(HomeScreen());
    }
    return;
  }
}
