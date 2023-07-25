import 'package:flexyy/models/gender.dart';
import 'package:flexyy/models/flexyy_string.dart';

class Informations {
  int age;
  Gender gender;
  double height;
  double weight;

  Informations(
      {required this.age,
      required this.gender,
      required this.height,
      required this.weight});
  factory Informations.fromJson(Map<String, Object> json) {
    final int age = json[ageText] as int;
    final Gender gender = genderFromJson(json[genderText] as String);
    final double height = json[heightText] as double;
    final double weight = json[weightText] as double;
    return Informations(
        age: age, gender: gender, height: height, weight: weight);
  }

  Map<String, Object> toJson() {
    return {
      ageText: age,
      genderText: gender,
      heightText: height,
      weightText: weight
    };
  }
}
