import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexyy/models/auth.dart';
import 'package:flexyy/models/database.dart';
import 'package:flexyy/models/exercise.dart';
import 'package:flexyy/models/flexyy_errors.dart';
import 'package:flexyy/models/flexyy_string.dart';
import 'package:flexyy/models/flexyy_user.dart';
import 'package:flexyy/models/muscle.dart';
import 'package:flexyy/models/recipe.dart';
import 'package:flexyy/models/utilities.dart';

import 'package:flutter/material.dart';

part 'flexyy_event.dart';
part 'flexyy_state.dart';

Auth _auth = Auth();
Database _database = Database();

class FlexyyBloc extends Bloc<FlexyyEvent, FlexyyState> {
  FlexyyBloc() : super(const LoginPageState(isLoading: false)) {
    on<InitializeAppEvent>((event, emit) async {
      final User? user = _auth.getUser();
      if (user == null) {
        emit(const LoginPageState(isLoading: false));
      } else {
        emit(const LoginPageState(isLoading: true));
        try {
          final FlexyyUser? flexyyUser = await _auth.createFlexyyUser(user);
          if (flexyyUser != null) {
            emit(HomePageState(isLoading: false, flexyyUser: flexyyUser));
          } else {
            throw (RandomError());
          }
        } catch (err) {
          final error = FlexyyError.fromRawError(err);
          await Utilities.waitAverageLoadingTime();
          emit(LoginPageState(isLoading: false, error: error));
        }
      }
    });
    on<ShowLoginPageEvent>((event, emit) {
      emit(const LoginPageState(isLoading: false));
    });
    on<ShowRegisterPageEvent>((event, emit) {
      emit(const RegisterPageState(isLoading: false));
    });
    on<LoginUserEvent>((event, emit) async {
      emit(const LoginPageState(isLoading: true));
      try {
        final FlexyyUser? flexyyUser =
            await _auth.loginUser(event.email, event.password);
        if (flexyyUser != null) {
          emit(HomePageState(isLoading: false, flexyyUser: flexyyUser));
        } else {
          throw (RandomError());
        }
      } catch (err) {
        final error = FlexyyError.fromRawError(err);
        await Utilities.waitAverageLoadingTime();
        emit(LoginPageState(isLoading: false, error: error));
      }
    });
    on<RegisterUserEvent>((event, emit) async {
      emit(const RegisterPageState(isLoading: true));
      try {
        final FlexyyUser? flexyyUser =
            await _auth.registerUser(event.email, event.password);
        if (flexyyUser != null) {
          emit(HomePageState(isLoading: false, flexyyUser: flexyyUser));
        } else {
          throw (RandomError());
        }
      } catch (err) {
        final error = FlexyyError.fromRawError(err);
        await Utilities.waitAverageLoadingTime();
        emit(RegisterPageState(isLoading: false, error: error));
      }
    });
    on<ShowAddWorkoutPageEvent>((event, emit) async {
      // this event is to initialize the add workout page to get the muscles from the database
      emit(HomePageState(isLoading: true, flexyyUser: state.flexyyUser));
      try {
        final ConnectivityResult connectivityResult =
            await Connectivity().checkConnectivity();
        if (connectivityResult == ConnectivityResult.none) {
          throw (NetworkRequestFailedError());
        }
        // get the json for each muscle and then convert it to a Muscle() Object
        final List<Muscle> muscles = [];
        final List<DocumentReference> musclesJson =
            await _database.getData([musclesText]);

        for (final snapshot in musclesJson) {
          final json = await snapshot.get();
          if (json.exists) {
            final muscle =
                Muscle.muscleFromJson(json.data() as Map<String, dynamic>);

            muscles.add(muscle);
          }
        }
        if (muscles.isEmpty) {
          throw (CancelledError());
        }

        emit(AddWorkoutPageState(
            isLoading: false, flexyyUser: state.flexyyUser, muscles: muscles));
      } catch (err) {
        final error = FlexyyError.fromRawError(err);
        await Utilities.waitAverageLoadingTime();

        emit(HomePageState(
            isLoading: false, flexyyUser: state.flexyyUser, error: error));
      }
    });
    // this event just to get the HomePageStateAgain
    on<GetHomePageEvent>((event, emit) {
      emit(HomePageState(isLoading: false, flexyyUser: state.flexyyUser));
    });
  }
}
