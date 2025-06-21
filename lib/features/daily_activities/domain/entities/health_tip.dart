import 'package:flutter/material.dart';

enum HealthTipType { official, unofficial }

class HealthTip {
  final String title;
  final String author;
  final String? imageUrl;
  final String? content;
  final DateTime? date;
  final HealthTipType type;

  HealthTip({
    required this.title,
    required this.author,
    this.imageUrl,
    this.content,
    this.date,
    this.type = HealthTipType.official,
  });
}
