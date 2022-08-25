import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notes_bloc/src/presentation/dialogs/loading_screen_controller.dart';

@immutable
class LoadingScreen {
  // singleton method
  LoadingScreen._singleton();
  static final LoadingScreen _instance = LoadingScreen._singleton();
  factory LoadingScreen.instance() => _instance;

  LoadingScreenController? _controller;

  LoadingScreenController showOverlay({
    required BuildContext context,
    required String text,
  }) {
    // stream text to update dialog text
    final textStream = StreamController<String>();
    textStream.add(text);

    final state = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    final onerlay = OverlayEntry(builder: (context) {
      return Material(
        color: Colors.black.withAlpha(150),
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints(
              maxHeight: size.height * 0.8,
              maxWidth: size.width * 0.8,
              minWidth: size.width * 0.5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const CircularProgressIndicator(),
                const SizedBox(height: 20),
                Text(text),
              ],
            ),
          ),
        ),
      );
    });
  }
}
