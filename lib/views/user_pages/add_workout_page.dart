import 'package:flexyy/blocs/flexyy_bloc/flexyy_bloc.dart';
import 'package:flexyy/models/exercise.dart';
import 'package:flexyy/models/flexyy_assets.dart';
import 'package:flexyy/models/flexyy_string.dart';
import 'package:flexyy/models/flexyy_user.dart';
import 'package:flexyy/models/muscle.dart';
import 'package:flexyy/models/utilities.dart';
import 'package:flexyy/utilities/dialog_helper.dart';

import 'package:flexyy/views/user_pages/controller_page.dart';
import 'package:flexyy/views/user_pages/home_page.dart';
import 'package:flexyy/views/widgets/workout_widgets/exercise_search.dart';
import 'package:flexyy/views/widgets/workout_widgets/muscle_card.dart';
import 'package:flexyy/views/widgets/workout_widgets/muscle_drop_down_button.dart';

import 'package:flexyy/views/widgets/workout_widgets/workout_description_field.dart';
import 'package:flexyy/views/widgets/workout_widgets/workout_name_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AddWorkoutPage extends HookWidget {
  final FlexyyUser flexyyUser;
  const AddWorkoutPage({super.key, required this.flexyyUser});

  @override
  Widget build(BuildContext context) {
    final workoutNameField = WorkoutNameField();
    final workoutDescriptionField = WorkoutDescriptionField();
    ValueNotifier<List<Muscle>> musclesTargeted = ValueNotifier(<Muscle>[]);
    final List<Muscle> muscles = [];
    final exercises = useState(<Exercise>[]);

    final bloc = BlocProvider.of<FlexyyBloc>(context);

    return BlocConsumer<FlexyyBloc, FlexyyState>(
      listener: (context, state) {
        if (state is! AddWorkoutPageState &&
            state.isLoading == false &&
            state.error != null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      HomePage(flexyyUser: state.flexyyUser!)));
          DialogHelper.showErrorDialog(context, state.error!);
        }
        if (state is AddWorkoutPageState) {
          if (muscles.isEmpty) {
            muscles.addAll(state.muscles);
          }
        }
      },
      builder: (context, state) {
        if (state is AddWorkoutPageState) {
          return WillPopScope(
            onWillPop: () async {
              bloc.add(GetHomePageEvent());
              return true;
            },
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(
                    backIcon,
                    color: yellowColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    bloc.add(GetHomePageEvent());
                  },
                ),
                backgroundColor: greyColor,
              ),
              backgroundColor: transparentColor,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        const Text(
                          addYourWorkoutHereText,
                          style: titleTextStyle,
                        ),
                        SizedBox(
                          height: screenHeight * 0.04,
                        ),
                        workoutNameField,
                        SizedBox(
                          height: screenHeight * 0.03,
                        ),
                        workoutDescriptionField,
                        SizedBox(
                          height: screenHeight * 0.03,
                        ),
                        MuscleDropDownButton(
                          fullList: muscles,
                          updatedList: musclesTargeted,
                          updateListFunction: Utilities.updateList,
                          isMuscle: true,
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              addWorkoutExercisesText,
                              style: highlightTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        ExerciseSearch(
                          musclesTargeted: musclesTargeted,
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Scaffold(backgroundColor: transparentColor);
        }
      },
    );
  }
}
