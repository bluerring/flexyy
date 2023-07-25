import 'package:flexyy/models/flexyy_assets.dart';
import 'package:flexyy/models/flexyy_string.dart';
import 'package:flexyy/models/flexyy_typedefs.dart';
import 'package:flexyy/models/muscle.dart';
import 'package:flexyy/views/user_pages/controller_page.dart';
import 'package:flexyy/views/widgets/workout_widgets/large_muscle_card.dart';
import 'package:flexyy/views/widgets/workout_widgets/muscle_card.dart';
import 'package:flutter/material.dart';

class MuscleDropDownButton extends StatelessWidget {
  final List fullList;
  final UpdateList updateListFunction;
  final ValueNotifier<List> updatedList;
  // the isMuscle boolean is an indicator if this works with Muscle Object
  // or Recipe Object to handle the items appropriately
  final bool isMuscle;

  const MuscleDropDownButton(
      {super.key,
      required this.fullList,
      required this.updatedList,
      required this.updateListFunction,
      required this.isMuscle});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DropdownButton(
            itemHeight: screenHeight * 0.095,
            dropdownColor: greyColor,
            hint: const Text(
              addWorkoutMusclesTargetedText,
              style: defaultTextStyle,
            ),
            onChanged: (item) {
              updateListFunction(updatedList.value, item);
            },
            items: fullList
                .map((muscle) => DropdownMenuItem(
                    value: muscle,
                    child: Column(children: [
                      MuscleCard(muscle: muscle),
                      Divider(
                        thickness: screenHeight * 0.005,
                        color: yellowColor,
                      )
                    ])))
                .toList(),
          ),
          SizedBox(height: screenHeight * 0.02),
          ValueListenableBuilder(
            valueListenable: updatedList,
            builder: (BuildContext context, List updatedList, Widget? child) =>
                updatedList.isNotEmpty
                    ? isMuscle
                        ? Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: yellowColor,
                                borderRadius: BorderRadius.circular(4)),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return LargeMuscleCard(
                                    muscle: updatedList[index]);
                              },
                              itemCount: updatedList.length,
                            ),
                          )
                        : Container()
                    : Container(),
          ),
        ],
      ),
    );
  }
}
