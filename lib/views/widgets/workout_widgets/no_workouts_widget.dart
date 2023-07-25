import 'package:flexyy/models/flexyy_assets.dart';
import 'package:flexyy/models/flexyy_string.dart';
import 'package:flexyy/views/user_pages/controller_page.dart';
import 'package:flutter/material.dart';

class NoWorkoutsWidget extends StatelessWidget {
  const NoWorkoutsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text(
        noWorkoutsHintText,
        style: emptyTextStyle,
      ),
      SizedBox(
        height: screenHeight * 0.02,
      ),
      const Text(
        addWorkoutHintText,
        style: emptyTextStyle,
      )
    ]);
  }
}
