import 'package:flexyy/blocs/flexyy_bloc/flexyy_bloc.dart';
import 'package:flexyy/models/flexyy_assets.dart';
import 'package:flexyy/models/flexyy_string.dart';
import 'package:flexyy/views/user_pages/controller_page.dart';
import 'package:flexyy/views/widgets/authentication_widgets/authentication_background.dart';
import 'package:flexyy/views/widgets/authentication_widgets/authentication_button.dart';
import 'package:flexyy/views/widgets/authentication_widgets/confirm_password_field.dart';
import 'package:flexyy/views/widgets/authentication_widgets/email_field.dart';
import 'package:flexyy/views/widgets/authentication_widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RegisterPage extends HookWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final FlexyyBloc bloc = BlocProvider.of<FlexyyBloc>(context);
    final EmailField emailField = EmailField();
    final PasswordField passwordField = PasswordField();
    final ConfirmPasswordField confirmPasswordField = ConfirmPasswordField();

    final backgroundAnimationController = useAnimationController(
      duration: const Duration(seconds: 2),
    );
    final textAnimationController = useAnimationController(
      duration: const Duration(seconds: 2),
    );

    final double textAnimation = useAnimation(
      Tween<double>(begin: 0.0, end: 1).animate(textAnimationController),
    );

    useEffect(() {
      void delayAnimation() async {
        await Future.delayed(const Duration(seconds: 3));
        textAnimationController.forward();
      }

      backgroundAnimationController.forward();
      delayAnimation();

      return () {
        backgroundAnimationController.dispose();
        textAnimationController.dispose();
      };
    }, []);

    return Scaffold(
      backgroundColor: mainColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            AuthenticationBackground(
                animationController: backgroundAnimationController),
            AnimatedBuilder(
              animation: textAnimationController,
              builder: (context, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Center(
                    child: Opacity(
                      opacity: textAnimation,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: screenHeight * 0.31),
                          const Text(
                            welcomeChampionText,
                            style: titleTextStyle,
                          ),
                          SizedBox(height: screenHeight * 0.025),
                          const Text(
                            introductoryText,
                            style: defaultTextStyle,
                          ),
                          SizedBox(height: screenHeight * 0.04),
                          emailField,
                          SizedBox(height: screenHeight * 0.02),
                          passwordField,
                          SizedBox(height: screenHeight * 0.02),
                          confirmPasswordField,
                          SizedBox(height: screenHeight * 0.023),
                          AuthenticationButton(
                              buttonText: registerText,
                              onPressed: () {
                                final String email =
                                    emailField.emailController.text;
                                final String password =
                                    passwordField.passwordController.text;
                                final String confirmPassword =
                                    confirmPasswordField
                                        .confirmPasswordController.text;
                                bloc.add(RegisterUserEvent(
                                    email: email,
                                    password: password,
                                    confirmPassword: confirmPassword));
                              }),
                          SizedBox(height: screenHeight * 0.01),
                          Row(
                            children: [
                              const Expanded(child: SizedBox()),
                              const Text(
                                alreadyRegisteredText,
                                style: defaultTextStyle,
                              ),
                              SizedBox(width: screenWidth * 0.01),
                              GestureDetector(
                                onTap: () {
                                  bloc.add(ShowLoginPageEvent());
                                },
                                child: const Text(
                                  loginText,
                                  style: highlightTextStyle,
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                            ],
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
