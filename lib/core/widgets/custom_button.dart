import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final Function() onPressed;
  const CustomButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(onPressed: onPressed, child: child));
  }
}
