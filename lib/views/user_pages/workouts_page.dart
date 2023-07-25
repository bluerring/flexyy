import 'package:flexyy/blocs/flexyy_bloc/flexyy_bloc.dart';
import 'package:flexyy/models/flexyy_assets.dart';
import 'package:flexyy/models/flexyy_errors.dart';
import 'package:flexyy/models/flexyy_string.dart';
import 'package:flexyy/models/flexyy_user.dart';
import 'package:flexyy/models/workout.dart';
import 'package:flexyy/utilities/dialog_helper.dart';
import 'package:flexyy/views/user_pages/add_workout_page.dart';
import 'package:flexyy/views/user_pages/controller_page.dart';

import 'package:flexyy/views/widgets/utilities_widgets/general_button.dart';
import 'package:flexyy/views/widgets/workout_widgets/no_workouts_widget.dart';
import 'package:flexyy/views/widgets/workout_widgets/workout_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutsPage extends StatelessWidget {
  final FlexyyUser flexyyUser;
  const WorkoutsPage({super.key, required this.flexyyUser});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FlexyyBloc>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Stack(children: [
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Text(
                workoutIntroductoryPageText,
                style: titleTextStyle,
              ),
            ),
            Expanded(
              child: flexyyUser.workouts.isNotEmpty
                  ? ListView.builder(
                      itemCount: flexyyUser.workouts.length,
                      itemBuilder: (context, index) {
                        final Workout workout = flexyyUser.workouts[index];
                        return WorkoutCard(workout: workout);
                      },
                    )
                  : const NoWorkoutsWidget(),
            ),
          ],
        ),
        Positioned(
          bottom: screenHeight * 0.03,
          left: screenWidth * 0.45,
          child: SafeArea(
            child: FloatingActionButton.extended(
              onPressed: () {
                bloc.add(ShowAddWorkoutPageEvent());
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddWorkoutPage(flexyyUser: flexyyUser);
                }));
              },
              label: const Text(
                addWorkoutText,
                style: buttonTextStyle,
              ),
              backgroundColor: yellowColor,
              foregroundColor: blackColor,
            ),
          ),
        )
      ]),
    );
  }
}
