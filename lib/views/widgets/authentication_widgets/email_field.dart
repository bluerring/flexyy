// ignore_for_file: must_be_immutable

import 'package:flexyy/models/flexyy_string.dart';
import 'package:flexyy/views/widgets/utilities_widgets/flexyy_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class EmailField extends HookWidget {
  late TextEditingController emailController;
  // we are making it late because we cant create a hookWidget outside of the build function
  // and we still need to access the controller from a completely other widget

  EmailField({super.key});
  @override
  Widget build(BuildContext context) {
    emailController = useTextEditingController();

    return FlexyyTextField(
      controller: emailController,
      hintText: emailHintText,
      hideText: false,
    );
  }
}
