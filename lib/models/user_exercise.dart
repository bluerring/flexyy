import 'package:flexyy/models/difficulty.dart';
import 'package:flexyy/models/exercise.dart';
import 'package:flexyy/models/flexyy_string.dart';

class UserExercise {
  String name;
  String instruction;
  String equipment;
  String muscleTargeted;
  Difficulty difficulty;
  double? weight;
  String imageLink;
  int sets;
  int repetitions;
  UserExercise(
      {required this.name,
      required this.instruction,
      required this.equipment,
      required this.muscleTargeted,
      required this.difficulty,
      this.weight,
      required this.imageLink,
      required this.sets,
      required this.repetitions});

  factory UserExercise.fromExerciseAndInputs(
      Exercise exercise, double weight, int sets, int repetitions) {
    return UserExercise(
        name: exercise.name,
        instruction: exercise.instruction,
        equipment: exercise.equipment,
        muscleTargeted: exercise.muscleTargeted,
        difficulty: exercise.difficulty,
        imageLink: exercise.imageLink,
        weight: weight,
        sets: sets,
        repetitions: repetitions);
  }
  Map<String, Object?> toJson() {
    return {
      nameText: name,
      instruction: instruction,
      equipementText: equipment,
      muscleTargeted: muscleTargeted,
      difficultyText: difficultyToJson(difficulty),
      weightText: weight,
      imageLinkText: imageLink,
      setsText: sets,
      repetitionsText: repetitions,
    };
  }

  factory UserExercise.fromJson(Map<String, Object?> json) {
    final String name = json[nameText] as String;
    final String instruction = json[instructionText] as String;
    final String equipment = json[equipementText] as String;
    final String muscleTargeted = json[muscleTargetedText] as String;
    final Difficulty difficulty =
        difficultyFromJson(json[difficultyText] as String)!;
    final double? weight = json[weightText] as double?;
    final String imageLink = json[imageLinkText] as String;
    final int sets = json[setsText] as int;
    final int repetitions = json[repetitionsText] as int;
    return UserExercise(
        name: name,
        instruction: instruction,
        equipment: equipment,
        muscleTargeted: muscleTargeted,
        difficulty: difficulty,
        weight: weight,
        imageLink: imageLink,
        sets: sets,
        repetitions: repetitions);
  }
}
