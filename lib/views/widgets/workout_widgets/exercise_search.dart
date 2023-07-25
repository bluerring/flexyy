import 'package:flexyy/models/flexyy_assets.dart';
import 'package:flexyy/models/flexyy_string.dart';
import 'package:flexyy/models/muscle.dart';

import 'package:flexyy/views/widgets/utilities_widgets/flexyy_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ExerciseSearch extends HookWidget {
  final ValueNotifier<List<Muscle>> musclesTargeted;

  const ExerciseSearch({super.key, required this.musclesTargeted});
  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    return ValueListenableBuilder(
      valueListenable: musclesTargeted,
      builder:
          (BuildContext context, List<Muscle> musclesTargeted, Widget? child) =>
              Column(
        children: [
          FlexyyTextField(
              controller: controller,
              hintText: searchExercisesText,
              hideText: false),
        ],
      ),
    );
  }
}
