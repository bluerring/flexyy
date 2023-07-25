import 'package:flexyy/blocs/flexyy_bloc/flexyy_bloc.dart';
import 'package:flexyy/models/flexyy_assets.dart';
import 'package:flexyy/models/flexyy_string.dart';
import 'package:flexyy/test_page.dart';
import 'package:flexyy/utilities/dialog_helper.dart';
import 'package:flexyy/utilities/loading_screen.dart';
import 'package:flexyy/views/user_pages/home_page.dart';
import 'package:flexyy/views/authentication_pages/login_page.dart';
import 'package:flexyy/views/authentication_pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Size? screenSize;
late double screenHeight;
late double screenWidth;
final DialogHelper dialogHelper = DialogHelper();
// this ControllerPage is responsible for displaying
// the Appropriate page based on the state of the bloc

class ControllerPage extends StatelessWidget {
  const ControllerPage({super.key});

  @override
  Widget build(BuildContext context) {
    // get the size of the screen and put it an a variable globally
    screenSize = MediaQuery.of(context).size;
    screenHeight = screenSize!.height;
    screenWidth = screenSize!.width;
    final LoadingScreen loadingScreen = LoadingScreen();

    return BlocConsumer<FlexyyBloc, FlexyyState>(
      builder: (context, state) {
        if (state.isLoading == false) {
          return SafeArea(
              child: (state is LoginPageState)
                  ? const LoginPage()
                  : (state is RegisterPageState)
                      ? const RegisterPage()
                      : HomePage(flexyyUser: state.flexyyUser!));
        } else {
          return Container();
        }
      },
      listener: (context, state) {
        if (state.isLoading) {
          loadingScreen.showLoadingScreen(pleaseWaitText, context);
        } else {
          loadingScreen.hideLoadingScreen();
        }
        if (state.error != null) {
          DialogHelper.showErrorDialog(context, state.error!);
        }
      },
    );
  }
}
