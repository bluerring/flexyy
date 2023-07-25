import 'package:flexyy/models/flexyy_assets.dart';
import 'package:flexyy/models/workout.dart';
import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final Workout workout;

  const WorkoutCard({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Column(
      children: [
        Text(
          workout.name,
          style: titleTextStyle,
        ),
      ],
    )));
  }
}
