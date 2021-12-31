import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      this.imageUrl,
      this.planText,
      this.bottom,
      this.showBasicButton = false,
      this.showLeadingButton = false,
      this.onBasicTap,
      this.onLeadingTap,
      this.actions,
      this.showBackButton = true,
      this.subscriptionPlan})
      : super(key: key);
  final String? planText;
  final String? imageUrl;
  final showBackButton;
  final PreferredSizeWidget? bottom;
  final String? subscriptionPlan;
  final bool showBasicButton;
  final Function? onBasicTap;
  final Function? onLeadingTap;
  final bool showLeadingButton;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 12,
      centerTitle: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.0),
          bottomRight: Radius.circular(16.0),
        ),
      ),
      title: Text(
        "Medicos",
        style: Theme.of(context).textTheme.headline6,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
