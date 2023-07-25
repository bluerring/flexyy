import 'package:cached_network_image/cached_network_image.dart';
import 'package:flexyy/models/flexyy_assets.dart';
import 'package:flexyy/models/muscle.dart';
import 'package:flexyy/views/user_pages/controller_page.dart';
import 'package:flutter/material.dart';

class MuscleCard extends StatelessWidget {
  final Muscle muscle;
  const MuscleCard({super.key, required this.muscle});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: screenHeight * 0.075,
        color: greyColor,
        child: Row(children: [
          CachedNetworkImage(
            imageUrl: muscle.imageLink,
            height: screenHeight * 0.075,
            width: screenWidth * 0.17,
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
