import 'package:cached_network_image/cached_network_image.dart';
import 'package:flexyy/models/flexyy_assets.dart';
import 'package:flexyy/models/muscle.dart';
import 'package:flexyy/views/user_pages/controller_page.dart';
import 'package:flutter/material.dart';

class LargeMuscleCard extends StatelessWidget {
  final Muscle muscle;
  const LargeMuscleCard({super.key, required this.muscle});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8),
        height: screenHeight * 0.13,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: greyColor),
        child: Row(children: [
          CachedNetworkImage(
            fadeInDuration: const Duration(milliseconds: 900),
            fadeOutDuration: const Duration(milliseconds: 900),
            imageUrl: muscle.imageLink,
            height: screenHeight * 0.12,
            width: screenWidth * 0.23,
            fit: BoxFit.fill,
          ),
          SizedBox(width: screenWidth * 0.1),
          Text(
            muscle.name,
            style: defaultTextStyle,
          )
        ]));
  }
}
