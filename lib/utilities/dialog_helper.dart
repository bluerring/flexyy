import 'package:flexyy/models/flexyy_assets.dart';
import 'package:flexyy/models/flexyy_errors.dart';
import 'package:flexyy/models/flexyy_string.dart';
import 'package:flexyy/models/flexyy_user.dart';

import 'package:flexyy/views/widgets/utilities_widgets/general_button.dart';
import 'package:flexyy/views/widgets/utilities_widgets/general_dialog.dart';
import 'package:flutter/material.dart';

class DialogHelper {
  static showErrorDialog(BuildContext context, FlexyyError error) {
    showDialog(
        context: context,
        builder: (context) => GeneralDialog(
              icon: errorIcon,
              title: error.title,
              content: error.content,
              buttons: [
                GeneralButton(
                    text: okText,
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ],
            ));
  }

  static showUpdateInformationDialog(
    BuildContext context,
  ) {}

  static showAddMealDialog(BuildContext context, FlexyyUser flexyyUser) {}
}
