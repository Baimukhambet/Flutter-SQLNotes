import 'package:flutter/material.dart';
import 'package:sql_notes/repositories/models/note.dart';
import 'package:sql_notes/repositories/models/sqlHelper.dart';
import 'package:sql_notes/pages/create_note_page.dart';
import 'package:sql_notes/repositories/notes_repository.dart';
import 'package:sql_notes/widgets/note_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NotesRepository notesRepository = NotesRepository();

  void fetchNotes() async {
    await notesRepository.loadNotes();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("SQLNotes"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CreateNotePage(
                            onCreate: (note) {
                              setState(() {
                                notesRepository.addNote(note.title, note.body);
                                fetchNotes();
                              });
                            },
                          )));
                },
                icon: Icon(Icons.create, color: theme.colorScheme.primary))
          ],
        ),
        body: ListView.builder(
          itemCount: notesRepository.notes.length,
          itemBuilder: (context, index) => NoteTile(
            key: Key(notesRepository.notes[index].id.toString()),
            title: notesRepository.notes[index].title,
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CreateNotePage(
                    note: notesRepository.notes[index],
                    onCreate: (note) {
                      setState(() {
                        notesRepository.updateNote(note);
                        fetchNotes();
                      });
                    }))),
            dismissed: () {
              notesRepository.deleteNote(notesRepository.notes[index].id);
            },
          ),
        ));
  }
}
