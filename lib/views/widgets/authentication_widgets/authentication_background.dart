import 'package:flexyy/models/flexyy_assets.dart';
import 'package:flexyy/views/user_pages/controller_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// this widget is responsible for displaying the image background
// and the fade animation of the black transition between the image and the black color
// for the authentication pages
class AuthenticationBackground extends HookWidget {
  final AnimationController animationController;
  const AuthenticationBackground(
      {super.key, required this.animationController});
  @override
  Widget build(BuildContext context) {
    final double fadeAnimation = useAnimation(
      Tween<double>(begin: 0.0, end: 0.97).animate(animationController),
    );

    return Stack(
      children: [
        // Background image
        Image.asset(
          'assets/images/chris.png',
          fit: BoxFit.cover,
          width: screenWidth,
          height: screenHeight,
        ),
        // Black overlay

        Column(
          children: [
            Container(
              height: screenHeight * 0.3,
            ),
            AnimatedBuilder(
                animation: animationController,
                builder: (context, child) => Opacity(
                      opacity: fadeAnimation,
                      child: Container(
                        // this is the  transition between the black color and the image
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [transparentColor, mainColor],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.1, 0.4])),
                        width: screenWidth,
                        height: screenHeight * 0.7,
                      ),
                    )),
          ],
        )
      ],
    );
  }
}
