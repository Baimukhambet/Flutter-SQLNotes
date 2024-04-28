import 'package:uuid/uuid.dart';

enum Importance { regular, medium, high }

class Note {
  String title;
  String body;
  Importance importance;
  final String id;

  Note({required this.title, required this.body, required this.importance})
      : id = const Uuid().v4();

  static List<Note> notes = [];

  static void addNote(Note note) {
    notes.add(note);
  }

  static void updateNote(Note updatedNote) {
    for (var element in notes) {
      if (element.id == updatedNote.id) {
        element.title = updatedNote.title;
        element.body = updatedNote.body;
      }
    }
  }
}
