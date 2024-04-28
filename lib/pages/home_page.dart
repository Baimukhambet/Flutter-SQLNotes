import 'package:flutter/material.dart';
import 'package:sql_notes/models/note.dart';
import 'package:sql_notes/pages/create_note_page.dart';
import 'package:sql_notes/widgets/note_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                                Note.addNote(note);
                              });
                            },
                          )));
                },
                icon: Icon(Icons.create, color: theme.colorScheme.primary))
          ],
        ),
        body: ListView.builder(
          itemCount: Note.notes.length,
          itemBuilder: (context, index) => NoteTile(
            title: Note.notes[index].title,
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CreateNotePage(
                    note: Note.notes[index],
                    onCreate: (note) {
                      setState(() {
                        Note.updateNote(note);
                      });
                    }))),
          ),
        ));
  }
}
