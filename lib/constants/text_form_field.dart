import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String? isToken;

Widget defaultFormField({
  TextEditingController? controller,
  TextInputType? type,
  List<TextInputFormatter>? inputFormatters,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  VoidCallback? onTap,
  VoidCallback? onEditingComplete,
  bool isPassword = false,
  FormFieldValidator<String>? validate,
  int? maxLines,
  String? label,
  IconData? prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
  Color? cursorColor,
  Color? prefixColor,
  Color? labelColor,
  bool isClickable = true,
}) =>
    TextFormField(
      cursorColor: cursorColor,
      controller: controller,
      keyboardType: type,
      maxLines: isPassword ? 1 : maxLines,
      inputFormatters: inputFormatters,
      onEditingComplete: onEditingComplete,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        disabledBorder: InputBorder.none,
        labelText: label,
        labelStyle: TextStyle(color: labelColor),
        prefixIcon: Icon(
          prefix,
          color: prefixColor,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: InputBorder.none,
      ),
    );
