import 'dart:async';

import 'package:flexyy/models/flexyy_assets.dart';
import 'package:flexyy/models/flexyy_string.dart';
import 'package:flexyy/utilities/loading_screen_controller.dart';
import 'package:flexyy/views/widgets/utilities_widgets/loading_spinkit.dart';
import 'package:flutter/material.dart';

class LoadingScreen {
  LoadingScreenController? _controller;

  LoadingScreen._shared();
  static final _sharedInstance = LoadingScreen._shared();
  factory LoadingScreen() => _sharedInstance;
  showLoadingScreen(String text, BuildContext context) {
    if (_controller == null) {
      _controller = _createLoadingScreen(text, context);
    } else {
      _controller!.update(text);
    }
  }

  hideLoadingScreen() {
    _controller?.remove();
    _controller = null;
  }

  _createLoadingScreen(String text, BuildContext context) {
    final textStream = StreamController<String>();
    textStream.add(text);
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry entry = OverlayEntry(
        builder: (BuildContext context) => Material(
              color: mainColor,
              child: Center(
                  child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LoadingSpinkit(),
                  const SizedBox(height: 8),
                  StreamBuilder<String>(
                      stream: textStream.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data!,
                            style: highlightTextStyle,
                          );
                        } else {
                          return const Text(
                            pleaseWaitText,
                            style: highlightTextStyle,
                          );
                        }
                      })
                ],
              )),
            ));
    overlayState.insert(entry);
    return LoadingScreenController(update: (String text) {
      textStream.add(text);
    }, remove: () {
      entry.remove();

      textStream.close();
    });
  }
}
