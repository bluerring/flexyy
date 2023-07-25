import 'package:flexyy/models/flexyy_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingSpinkit extends StatelessWidget {
  const LoadingSpinkit({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitSquareCircle(
      color: yellowColor,
      size: 40,
    );
  }
}
