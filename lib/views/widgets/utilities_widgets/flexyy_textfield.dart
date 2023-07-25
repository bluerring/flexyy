import 'package:flexyy/models/flexyy_assets.dart';
import 'package:flexyy/models/flexyy_typedefs.dart';
import 'package:flutter/material.dart';

class FlexyyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool hideText;
  final Update? onChanged;
  final bool? enabled;

  const FlexyyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.hideText,
    this.onChanged,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      onChanged: onChanged,
      style: defaultTextStyle,
      controller: controller,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(width: 6, color: defaultColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(width: 4, color: defaultBorderColor)),
          hintText: hintText,
          hintStyle: hintTextStyle),
      obscureText: hideText,
    );
  }
}
