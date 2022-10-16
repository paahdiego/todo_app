import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/modules/core/core.dart';

class AppInputField extends StatelessWidget {
  const AppInputField({
    Key? key,
    this.controller,
    this.hintText,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.autocorrect = false,
    this.textInputAction = TextInputAction.done,
    this.inputFormatters,
    this.textInputType = TextInputType.text,
    this.validator,
    this.obscureText = false,
    this.onFieldSubmitted,
    this.onChanged,
  }) : super(key: key);

  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final String? hintText;
  final String? label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final AutovalidateMode autovalidateMode;
  final bool autocorrect;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType textInputType;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: AppTextStyles.bodyText1(context)?.copyWith(fontSize: 16),
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      autovalidateMode: autovalidateMode,
      autocorrect: autocorrect,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      obscureText: obscureText,
      keyboardType: textInputType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: label,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        labelStyle: AppTextStyles.bodyText1(context)?.copyWith(fontSize: 14),
        fillColor: AppColors.subBackgroundColor(context),
        focusColor: AppColors.primary,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: AppSizes.defaultBorderRadius,
          borderSide: BorderSide(
            width: 1.0,
            style: BorderStyle.solid,
            color: AppColors.fontColor(context).withAlpha(180),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppSizes.defaultBorderRadius,
          borderSide: const BorderSide(
            width: 1.0,
            style: BorderStyle.solid,
            color: AppColors.primary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppSizes.defaultBorderRadius,
          borderSide: const BorderSide(
            width: 1.0,
            style: BorderStyle.solid,
            color: AppColors.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppSizes.defaultBorderRadius,
          borderSide: const BorderSide(
            width: 1.0,
            style: BorderStyle.solid,
            color: AppColors.error,
          ),
        ),
        errorStyle: AppTextStyles.bodyText1(context)?.copyWith(
          color: AppColors.error,
        ),
      ),
    );
  }
}
