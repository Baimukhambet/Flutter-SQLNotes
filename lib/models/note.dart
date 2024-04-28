import 'package:flutter/material.dart';
import 'package:sql_notes/models/sqlHelper.dart';
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

  static List<Note> notes = [];

  static void addNote(Note note) {
    Note.notes.add(note);
  }

  static void updateNote(Note updatedNote) {
    for (var element in Note.notes) {
      if (element.id == updatedNote.id) {
        element.title = updatedNote.title;
        element.body = updatedNote.body;
      }
    }
  }

  static void fetchNotes() async {
    final data = await SQLHelper.getNotes();
    // debugPrint(data.first.toString());
    for (var el in data) {
      final note = Note(id: el['id'], title: el['title']!, body: el['body']!);
      Note.notes.add(note);
    }
  }
}
