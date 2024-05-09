import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
AppBar App_bar_widget(BuildContext context, {required String title, VoidCallback? onTap}) {
  return AppBar(
    title: Text(
      title,
    ),
  );
}
