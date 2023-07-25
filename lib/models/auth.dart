import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexyy/models/database.dart';
import 'package:flexyy/models/flexyy_user.dart';
import 'package:flexyy/models/informations.dart';
import 'package:flexyy/models/meal.dart';
import 'package:flexyy/models/flexyy_errors.dart';
import 'package:flexyy/models/flexyy_string.dart';
import 'package:flexyy/models/workout.dart';

final _database = Database();

class Auth {
  // singleton pattern
  Auth._sharedInstance();
  static final _shared = Auth._sharedInstance();
  factory Auth() {
    return _shared;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create a user account using email and password
  Future<FlexyyUser?> registerUser(String email, String password) async {
    final UserCredential userCredential = await _auth
        .createUserWithEmailAndPassword(email: email, password: password);
    final User? user = userCredential.user;
    if (user != null) {
      FlexyyUser flexyyUser = FlexyyUser.newAccount(user, password);
      return flexyyUser;
    } else {
      return null;
    }
  }

  // login a user using email and password
  Future<FlexyyUser?> loginUser(String email, String password) async {
    final UserCredential userCredential = await _auth
        .signInWithEmailAndPassword(email: email, password: password);
    final User? user = userCredential.user;
    if (user != null) {
      FlexyyUser? flexyyUser = await createFlexyyUser(user);
      if (flexyyUser != null) {
        return flexyyUser;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  logoutUser() async {
    await _auth.signOut();
  }

  deleteUser(FlexyyUser flexyyUser) async {
    final UserCredential userCredential =
        await _auth.signInWithEmailAndPassword(
            email: flexyyUser.email, password: flexyyUser.password);
    final User? user = userCredential.user;
    if (user != null) {
      await user.delete();
    }
  }

  User? getUser() {
    return _auth.currentUser;
  }

  // create an instance of a FlexyyUser to use it inside the app
  Future<FlexyyUser?> createFlexyyUser(
    User user,
  ) async {
    final List<String> subCollections = [usersText, user.uid];
    final Map<String, Object?>? userData =
        await _database.getData(subCollections);
    if (userData != null) {
      final String userId = userData[userIdText] as String;

      final String email = userData[emailText] as String;
      final String password = userData[passwordText] as String;
      final Map<String, Object>? informationsJson =
          userData[informationsText] as Map<String, Object>?;
      // check first if the user has informations or an empty map else null
      final Informations? userInformations = informationsJson != null
          ? informationsJson.isNotEmpty
              ? Informations.fromJson(
                  userData[informationsText] as Map<String, Object>)
              : null
          : null;
      final List<String> workoutPath = [usersText, user.uid, workoutsText];
      final List<String> mealsPath = [usersText, user.uid, mealsText];
      final List<Workout> workouts = [];
      final List<Meal> meals = [];

      final List<DocumentReference> workoutsCollection =
          await _database.getData(workoutPath) as List<DocumentReference>;

      final List<DocumentReference> mealsCollection =
          await _database.getData(mealsPath) as List<DocumentReference>;

      for (final DocumentReference workoutDoc in workoutsCollection) {
        final DocumentSnapshot<Object?> snapshot = await workoutDoc.get();
        final json = snapshot.data() as Map<String, Object>?;
        if (json != null && json.isNotEmpty) {
          final Workout workout = Workout.fromJson(json);
          workouts.add(workout);
        }
      }
      for (final DocumentReference mealDoc in mealsCollection) {
        final DocumentSnapshot<Object?> snapshot = await mealDoc.get();
        final json = snapshot.data() as Map<String, Object>?;
        if (json != null && json.isNotEmpty) {
          final Meal meal = Meal.fromJson(json);
          meals.add(meal);
        }
      }
      return FlexyyUser(
          userId: userId,
          email: email,
          password: password,
          workouts: workouts,
          meals: meals,
          userInformations: userInformations);
    } else {
      return null;
    }
  }
}
