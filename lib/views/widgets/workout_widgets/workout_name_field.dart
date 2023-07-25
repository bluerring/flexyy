import 'package:flexyy/models/flexyy_string.dart';
import 'package:flexyy/views/widgets/utilities_widgets/flexyy_textfield.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class WorkoutNameField extends HookWidget {
  late TextEditingController workoutNameController;
  WorkoutNameField({super.key});

  @override
  Widget build(BuildContext context) {
    workoutNameController = useTextEditingController();
    return FlexyyTextField(
        controller: workoutNameController,
        hintText: enterWorkoutNameText,
        hideText: false);
    ;
  }
}
