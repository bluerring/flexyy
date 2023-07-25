import 'package:flexyy/models/flexyy_assets.dart';
import 'package:flexyy/models/flexyy_typedefs.dart';
import 'package:flexyy/views/user_pages/controller_page.dart';
import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget {
  final String text;
  final OnPressed onPressed;
  const GeneralButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: TextButton(
          onPressed: onPressed,
          child: Container(
            height: screenHeight * 0.05,
            width: screenWidth * 0.2,
            decoration: BoxDecoration(
                color: yellowColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all()),
            child: Center(
              child: Text(
                text,
                style: buttonTextStyle,
              ),
            ),
          )),
    );
  }
}
