part of 'flexyy_bloc.dart';

@immutable
abstract class FlexyyState {
  final bool isLoading;
  final FlexyyError? error;
  final FlexyyUser? flexyyUser;
  const FlexyyState({required this.isLoading, this.error, this.flexyyUser});
}

class RegisterPageState extends FlexyyState {
  const RegisterPageState({required super.isLoading, super.error});
}

class LoginPageState extends FlexyyState {
  const LoginPageState({required super.isLoading, super.error});
}

class HomePageState extends FlexyyState {
  const HomePageState(
      {required super.isLoading, super.error, required super.flexyyUser});
}

class AddWorkoutPageState extends FlexyyState {
  final List<Exercise>? exercises;
  final List<Muscle> muscles;
  const AddWorkoutPageState(
      {required super.isLoading,
      super.error,
      required super.flexyyUser,
      this.exercises,
      required this.muscles});
}

class AddMealPageState extends FlexyyState {
  final List<Recipe> recipes;
  const AddMealPageState(
      {required super.isLoading,
      required super.flexyyUser,
      required this.recipes});
}
