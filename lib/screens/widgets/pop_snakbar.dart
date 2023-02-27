import 'package:flutter/material.dart';

class Popsnakbar {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> popUpSnackBar(
      context, String text, Color color) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(text),
        backgroundColor: color,
      ),
    );
  }
}
