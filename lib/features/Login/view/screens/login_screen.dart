import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:test_me/core/theme/app_theme.dart';
import 'package:test_me/core/utils/Validators/validators.dart';
import 'package:test_me/core/utils/size_config.dart';
import 'package:test_me/core/widgets/app_bar_widget.dart';
import 'package:test_me/core/widgets/custom_button.dart';
import 'package:test_me/core/widgets/custom_text_field.dart';
import 'package:test_me/features/Login/view/widgets/social_button.dart';
import 'package:test_me/features/Login/view_model/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final LoginViewModelImpl loginViewModelImpl = Get.put(LoginViewModelImpl());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Form(
            key: loginViewModelImpl.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/medicos.png",
                  height: 35.h,
                ),
                CustomTextField(
                  title: "E-mail",
                  hintText: "someone@example.com",
                  width: 85.w,
                  validator: Validators.validateEmail,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "assets/icons/user.png",
                      width: 3.w,
                      height: 3.h,
                      color: AppTheme.secondaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                CustomTextField(
                  title: "Password",
                  obscureText: true,
                  hintText: "Password",
                  width: 85.w,
                  validator: Validators.validateEmptyPassword,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "assets/icons/password.png",
                      width: 3.w,
                      height: 3.h,
                      color: AppTheme.secondaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text(
                      "Forgot password?",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 15.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomButton(
                  width: 70.w,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: Text(
                      "Login",
                      style: Theme.of(context)
                          .textTheme
                          .button!
                          .copyWith(fontSize: 18.sp),
                    ),
                  ),
                  onPressed: () {
                    loginViewModelImpl.login();
                  },
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Text(
                  "or continue with",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      onPressed: () {},
                      icon: FontAwesomeIcons.facebook,
                      iconColor: AppTheme.blueColor,
                    ),
                    SocialButton(
                      onPressed: () {},
                      icon: FontAwesomeIcons.googlePlus,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
