import 'package:flexyy/models/flexyy_string.dart';
import 'package:flexyy/views/widgets/utilities_widgets/flexyy_textfield.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class WorkoutDescriptionField extends HookWidget {
  late TextEditingController workoutDescriptionController;
  WorkoutDescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    workoutDescriptionController = useTextEditingController();

    return FlexyyTextField(
        controller: workoutDescriptionController,
        hintText: enterWorkoutDescriptionText,
        hideText: false);
  }
}
