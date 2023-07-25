import 'package:flexyy/models/flexyy_assets.dart';
import 'package:flexyy/models/flexyy_typedefs.dart';
import 'package:flexyy/views/user_pages/controller_page.dart';
import 'package:flutter/material.dart';

class AuthenticationButton extends StatelessWidget {
  final String buttonText;
  final OnPressed onPressed;
  AuthenticationButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Container(
          decoration: BoxDecoration(
              color: yellowColor,
              border: Border.all(),
              borderRadius: BorderRadius.circular(8)),
          width: screenWidth * 0.5,
          height: screenHeight * 0.1,
          child: Center(
            child: Text(
              buttonText,
              style: authenticationButtonTextStyle,
            ),
          ),
        ));
  }
}
