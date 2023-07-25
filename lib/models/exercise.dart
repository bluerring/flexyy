import 'package:flexyy/models/difficulty.dart';
import 'package:flexyy/models/flexyy_string.dart';

// this class is for the exercises that the user is going to choose to make his workout

class Exercise {
  final String name;
  final String instruction;
  final Difficulty difficulty;
  final String equipment;
  final String muscleTargeted;
  final String imageLink;

  Exercise({
    required this.name,
    required this.instruction,
    required this.difficulty,
    required this.equipment,
    required this.muscleTargeted,
    required this.imageLink,
  });
  Map<String, Object> toJson() {
    return {
      nameText: name,
      instructionText: instruction,
      difficultyText: difficultyToJson(difficulty)!,
      equipementText: equipment,
      muscleTargetedText: muscleTargeted,
      imageLinkText: imageLink
    };
  }

  factory Exercise.fromJson(Map<String, Object> json) {
    final String name = json[nameText] as String;
    final String instruction = json[instructionText] as String;
    final Difficulty difficulty =
        difficultyFromJson(json[difficultyText] as String)!;
    final String equipment = json[equipementText] as String;
    final String muscleTargeted = json[muscleTargetedText] as String;
    final String imageLink = json[imageLinkText] as String;
    return Exercise(
        name: name,
        instruction: instruction,
        difficulty: difficulty,
        equipment: equipment,
        muscleTargeted: muscleTargeted,
        imageLink: imageLink);
  }
}
