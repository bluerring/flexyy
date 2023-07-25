import 'package:flexyy/models/flexyy_assets.dart';
import 'package:flexyy/models/flexyy_errors.dart';
import 'package:flexyy/models/flexyy_string.dart';
import 'package:flexyy/models/flexyy_user.dart';
import 'package:flexyy/views/user_pages/meals_page.dart';
import 'package:flexyy/views/user_pages/profile_page.dart';
import 'package:flexyy/views/user_pages/workouts_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  final FlexyyUser flexyyUser;

  const HomePage({super.key, required this.flexyyUser});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      WorkoutsPage(
        flexyyUser: widget.flexyyUser,
      ),
      const MealsPage(),
      const ProfilePage()
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainColor,
        bottomNavigationBar: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                color: yellowColor, borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: GNav(
                  selectedIndex: _index,
                  onTabChange: (index) {
                    setState(() {
                      _index = index;
                    });
                  },
                  padding: const EdgeInsets.all(16),
                  tabActiveBorder: Border.all(color: Colors.black, width: 1),
                  duration: const Duration(milliseconds: 350),
                  textStyle: buttonTextStyle,
                  gap: 5,
                  iconSize: 35,
                  backgroundColor: yellowColor,
                  tabs: const [
                    GButton(
                      icon: workoutIcon,
                      text: workoutsText,
                      iconColor: blackColor,
                      iconActiveColor: blackColor,
                    ),
                    GButton(
                      icon: mealsIcon,
                      text: mealsText,
                      iconColor: blackColor,
                      iconActiveColor: blackColor,
                    ),
                    GButton(
                      icon: profileIcon,
                      text: profileText,
                      iconColor: blackColor,
                      iconActiveColor: blackColor,
                    ),
                  ]),
            ),
          ),
        ),
        body: pages.elementAt(_index),
      ),
    );
  }
}
