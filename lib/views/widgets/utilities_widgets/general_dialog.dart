import 'package:flexyy/models/flexyy_assets.dart';
import 'package:flexyy/views/user_pages/controller_page.dart';

import 'package:flexyy/views/widgets/utilities_widgets/general_button.dart';
import 'package:flutter/material.dart';

class GeneralDialog extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final List<GeneralButton> buttons;
  const GeneralDialog(
      {super.key,
      required this.icon,
      required this.title,
      required this.content,
      required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: transparentColor,
      child: Center(
          child: SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(
                color: greyColor, borderRadius: BorderRadius.circular(10)),
            height: screenHeight * 0.48,
            width: screenWidth * 0.88,
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  Icon(
                    icon,
                    size: 80,
                    color: yellowColor,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Text(
                    title,
                    style: titleTextStyle,
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      content,
                      style: defaultTextStyle,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: buttons,
                  ),
                ])),
      )),
    );
  }
}
