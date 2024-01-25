import 'package:coincanvas/configs/custom_colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidgetCopy extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? suffixWidget;
  final TextCapitalization? textCapitalization;
  final void Function()? onTap;
  final bool obscureText;
  final String hintText;
  final int? maxLines;
  final int? maxLength;

  const TextFieldWidgetCopy({
    super.key,
    this.controller,
    this.keyboardType,
    this.suffixWidget,
    this.textCapitalization,
    this.onTap,
    this.obscureText = false,
    this.hintText = '',
    this.maxLines,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: false,
      onTap: onTap,
      maxLines: obscureText ? 1 : maxLines,
      maxLength: maxLength,
      obscureText: obscureText,
      textCapitalization: textCapitalization!,
      keyboardType: keyboardType,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
        suffix: suffixWidget,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: CustomColors.deepCerulean),
        ),
      ),
    );
  }
}
