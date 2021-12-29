import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_me/core/utils/size_config.dart';

class SocialButton extends StatelessWidget {
  final Function()? onPressed;
  final IconData? icon;
  final Color? iconColor;
  const SocialButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: FaIcon(
        icon,
        color: iconColor,
      ),
      iconSize: SizeConfig.safeBlockHorizontal! * 14,
      splashRadius: 25,
    );
  }
}
