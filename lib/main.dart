import 'package:firebase_core/firebase_core.dart';

import 'package:flexyy/blocs/flexyy_bloc/flexyy_bloc.dart';
import 'package:flexyy/firebase_options.dart';
import 'package:flexyy/test_page.dart';

import 'package:flexyy/views/user_pages/controller_page.dart';
import 'package:flexyy/views/user_pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FlexyyBloc>(
      create: (context) => FlexyyBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flexyy',
        theme: ThemeData(fontFamily: "Bebas_Neue"),
        home: const ControllerPage(),
      ),
    );
  }
}
