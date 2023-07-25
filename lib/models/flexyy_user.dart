import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexyy/models/meal.dart';
import 'package:flexyy/models/informations.dart';
import 'package:flexyy/models/workout.dart';

class FlexyyUser {
  String userId;
  String email;
  String password;
  Informations? userInformations;
  List<Workout> workouts;
  List<Meal> meals;
  FlexyyUser(
      {required this.userId,
      required this.email,
      required this.password,
      required this.workouts,
      required this.meals,
      this.userInformations});

  // this constructor is used when we create a new account
  factory FlexyyUser.newAccount(User user, String password) {
    final String userId = user.uid;
    final String email = user.email!;

    return FlexyyUser(
        userId: userId,
        email: email,
        password: password,
        workouts: [],
        meals: []);
  }
}
