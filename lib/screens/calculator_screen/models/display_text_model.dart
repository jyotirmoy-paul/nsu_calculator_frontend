import 'package:flutter/material.dart';

class DisplayTextModel {
  final String text;
  final Color? color;

  const DisplayTextModel({
    required this.text,
    this.color,
  });

  static const empty = DisplayTextModel(
    text: '0',
    color: Colors.transparent,
  );
}
