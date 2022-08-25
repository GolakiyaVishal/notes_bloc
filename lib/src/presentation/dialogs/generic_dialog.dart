import 'package:flutter/material.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function();

Future<T?> showGenericDialog<T>(
  final BuildContext context,
  final String title,
  final String content,
  final DialogOptionBuilder optionBuilder,
) async {
  final options = optionBuilder();

  return showDialog<T?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: options.keys.map((key) {
            final value = options[key];

            return TextButton(
              onPressed: () {
                if (value == null) {
                  Navigator.of(context).pop();
                } else {
                  Navigator.of(context).pop(value);
                }
              },
              child: Text(key),
            );
          }).toList(),
        );
      });
}
