// this file is for the different assets in the app

import 'package:flutter/material.dart';

import 'package:line_icons/line_icons.dart';

// this section is for the app colors
const Color mainColor = Color.fromARGB(255, 10, 10, 10);
const Color greyColor = Color.fromARGB(255, 36, 36, 36);
const Color transparentColor = Colors.transparent;
const Color yellowColor = Color.fromARGB(255, 240, 179, 13);
const Color defaultColor = Color.fromARGB(255, 243, 243, 243);
const Color defaultBorderColor = Color.fromARGB(255, 211, 211, 211);
const Color hintTextColor = Color.fromARGB(133, 201, 201, 201);
const Color navigationBarColor = Color.fromARGB(255, 7, 7, 7);
const Color blackColor = Colors.black;

// this section is for text styles
const TextStyle titleTextStyle =
    TextStyle(color: yellowColor, fontSize: 26, fontWeight: FontWeight.bold);
const TextStyle defaultTextStyle = TextStyle(color: defaultColor, fontSize: 18);
const TextStyle hintTextStyle = TextStyle(color: hintTextColor);
const TextStyle authenticationButtonTextStyle =
    TextStyle(color: blackColor, fontSize: 30);
const TextStyle highlightTextStyle =
    TextStyle(color: yellowColor, fontSize: 18);
const TextStyle buttonTextStyle = TextStyle(color: blackColor, fontSize: 22);
const TextStyle emptyTextStyle = TextStyle(color: hintTextColor, fontSize: 22);

// this section is for icons

const IconData errorIcon = LineIcons.bug;
const IconData workoutIcon = LineIcons.dumbbell;
const IconData mealsIcon = LineIcons.drumstickWithBiteTakenOut;
const IconData informationsIcon = LineIcons.questionCircle;
const IconData alertIcon = LineIcons.exclamationCircle;
const IconData profileIcon = LineIcons.userCircle;
const IconData backIcon = LineIcons.chevronLeft;
