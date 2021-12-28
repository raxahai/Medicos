import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final double? height;
  final double? width;
  final TextEditingController? controller;
  final TextStyle? style;
  final Widget prefixIcon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final int? maxLength;
  final String? hintText;
  const CustomTextField({
    Key? key,
    this.controller,
    required this.title,
    required this.prefixIcon,
    this.style,
    this.hintText,
    this.validator,
    this.height,
    this.width,
    this.obscureText = false,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(1.0),
          ),
          TextFormField(
            autocorrect: false,
            maxLength: maxLength,
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              hintText: hintText,
            ),
            style: style,
            obscureText: obscureText,
            validator: validator,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
