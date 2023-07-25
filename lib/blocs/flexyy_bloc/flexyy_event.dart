part of 'flexyy_bloc.dart';

@immutable
abstract class FlexyyEvent {}

class ShowLoginPageEvent extends FlexyyEvent {}

class ShowRegisterPageEvent extends FlexyyEvent {}

class ShowHomePageEvent extends FlexyyEvent {}

class ShowAddWorkoutPageEvent extends FlexyyEvent {}

class ShowInformationsDialogEvent extends FlexyyEvent {}

class ShowWorkoutsViewExitDialogEvent extends FlexyyEvent {}

class RegisterUserEvent extends FlexyyEvent {
  final String email;
  final String password;
  final String confirmPassword;
  RegisterUserEvent(
      {required this.email,
      required this.password,
      required this.confirmPassword});
}

class LoginUserEvent extends FlexyyEvent {
  final String email;
  final String password;
  LoginUserEvent({required this.email, required this.password});
}

class InitializeAppEvent extends FlexyyEvent {}

class GetHomePageEvent extends FlexyyEvent {}
