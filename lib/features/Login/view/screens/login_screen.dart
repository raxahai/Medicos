import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_me/core/theme/app_theme.dart';
import 'package:test_me/core/utils/Validators/validators.dart';
import 'package:test_me/core/utils/size_config.dart';
import 'package:test_me/core/widgets/app_bar_widget.dart';
import 'package:test_me/core/widgets/custom_button.dart';
import 'package:test_me/core/widgets/custom_text_field.dart';
import 'package:test_me/features/Login/view/widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/medicos.png",
                  height: SizeConfig.safeBlockVertical! * 38,
                ),
                CustomTextField(
                  title: "E-mail",
                  hintText: "someone@example.com",
                  width: SizeConfig.blockSizeHorizontal! * 85,
                  validator: Validators.validateEmail,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "assets/icons/user.png",
                      width: SizeConfig.safeBlockHorizontal! * 3,
                      height: SizeConfig.safeBlockVertical! * 3,
                      color: AppTheme.secondaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical! * 1.5,
                ),
                CustomTextField(
                  title: "Password",
                  hintText: "Password",
                  width: SizeConfig.blockSizeHorizontal! * 85,
                  validator: Validators.validateEmptyPassword,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "assets/icons/password.png",
                      width: 30,
                      height: 30,
                      color: AppTheme.secondaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical! * 2,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Text(
                      "Forgot password?",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 15.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  width: SizeConfig.blockSizeHorizontal! * 70,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(
                      "Login",
                      style: Theme.of(context)
                          .textTheme
                          .button!
                          .copyWith(fontSize: 22),
                    ),
                  ),
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                  },
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical! * 1.5,
                ),
                Text(
                  "or continue with",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical! * 1,
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
