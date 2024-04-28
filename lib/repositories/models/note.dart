import 'package:flutter/material.dart';
import 'package:sql_notes/repositories/models/sqlHelper.dart';
import 'package:uuid/uuid.dart';

enum Importance { regular, medium, high }

class Note {
  String title;
  String body;
  // Importance importance;
  final int id;

  Note({
    required this.id,
    required this.title,
    required this.body,
    // required this.importance
  });
}
