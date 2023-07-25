import 'package:flexyy/blocs/flexyy_bloc/flexyy_bloc.dart';
import 'package:flexyy/models/flexyy_assets.dart';
import 'package:flexyy/models/flexyy_string.dart';
import 'package:flexyy/views/user_pages/controller_page.dart';
import 'package:flexyy/views/widgets/authentication_widgets/authentication_background.dart';
import 'package:flexyy/views/widgets/authentication_widgets/authentication_button.dart';
import 'package:flexyy/views/widgets/authentication_widgets/email_field.dart';
import 'package:flexyy/views/widgets/authentication_widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final FlexyyBloc bloc = BlocProvider.of<FlexyyBloc>(context);
    // creating instances so then we can access them in the button
    EmailField emailField = EmailField();
    PasswordField passwordField = PasswordField();

    final backgroundAnimationController = useAnimationController(
      duration: const Duration(seconds: 2),
    );
    final textAnimationController = useAnimationController(
      duration: const Duration(seconds: 2),
    );

    final double fadeTextAnimation = useAnimation(
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
                      opacity: fadeTextAnimation,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: screenHeight * 0.36),
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
                          SizedBox(height: screenHeight * 0.03),
                          passwordField,
                          SizedBox(height: screenHeight * 0.04),
                          AuthenticationButton(
                              buttonText: loginText,
                              onPressed: () {
                                final String email =
                                    emailField.emailController.text;
                                final String password =
                                    passwordField.passwordController.text;
                                bloc.add(LoginUserEvent(
                                    email: email, password: password));
                              }),
                          SizedBox(height: screenHeight * 0.023),
                          Row(
                            children: [
                              const Expanded(child: SizedBox()),
                              const Text(
                                newAroundHereText,
                                style: defaultTextStyle,
                              ),
                              SizedBox(width: screenWidth * 0.01),
                              GestureDetector(
                                onTap: () {
                                  bloc.add(ShowRegisterPageEvent());
                                },
                                child: const Text(
                                  registerText,
                                  style: highlightTextStyle,
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                            ],
                          )
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
