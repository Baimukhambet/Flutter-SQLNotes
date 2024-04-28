import 'package:sql_notes/repositories/models/note.dart';
import 'package:sql_notes/repositories/models/sqlHelper.dart';

class NotesRepository {
  List<Note> notes = [];

  Future<void> loadNotes() async {
    final data = await SQLHelper.getNotes();
    notes = data
        .map((e) => Note(id: e['id'], title: e['title'], body: e['body']))
        .toList();
  }

  void addNote(String title, String body) async {
    final id = await SQLHelper.createNote(title, body);
    final note = Note(id: id, title: title, body: body);
    notes.add(note);
  }

  void deleteNote(int id) async {
    SQLHelper.deleteNote(id);
    notes.removeWhere((e) => e.id == id);
  }

  void updateNote(Note note) async {
    await SQLHelper.updateNote(note.id, note.title, note.body);
  }
}
