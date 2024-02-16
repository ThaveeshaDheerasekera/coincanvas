import 'package:coincanvas/configs/custom_colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? suffixWidget;
  final TextCapitalization? textCapitalization;
  final void Function()? onTap;
  final bool obscureText;
  final String? hintText;
  final int? maxLines;
  final int? maxLength;

  const TextFieldWidget({
    super.key,
    this.controller,
    this.keyboardType,
    this.suffixWidget,
    this.textCapitalization,
    this.onTap,
    this.obscureText = false,
    this.hintText,
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
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      keyboardType: keyboardType ?? TextInputType.text,
      cursorColor: CustomColors.oliveColor,
      style: TextStyle(color: CustomColors.primaryColor),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.all(5),
        hintText: hintText ?? '',
        hintStyle: TextStyle(
          fontSize: 14,
          color: CustomColors.primaryColor.withOpacity(0.5),
        ),
        counterStyle: TextStyle(
          color: CustomColors.primaryColor.withOpacity(0.5),
        ),
        suffix: suffixWidget,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5, color: CustomColors.primaryColor),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5, color: CustomColors.oliveColor),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
