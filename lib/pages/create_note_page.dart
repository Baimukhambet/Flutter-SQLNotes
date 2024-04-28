import 'package:flutter/material.dart';
import 'package:sql_notes/models/note.dart';
import 'package:sql_notes/models/sqlHelper.dart';

class CreateNotePage extends StatelessWidget {
  CreateNotePage({super.key, required this.onCreate, this.note}) {
    if (note != null) {
      _titleController.text = note!.title;
      _bodyController.text = note!.body;
    }
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  Note? note;

  void Function(Note note) onCreate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: const Text("New Note"),
          actions: [
            IconButton(
                onPressed: () async {
                  if (note == null) {
                    final id = await SQLHelper.createNote(
                        _titleController.text, _bodyController.text);

                    note = Note(
                      id: id,
                      title: _titleController.text,
                      body: _bodyController.text,
                      // importance: Importance.regular
                    );
                  } else {
                    note!.title = _titleController.text;
                    note!.body = _bodyController.text;
                  }
                  onCreate(note!);
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.done))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                      hintText: "Title",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: TextField(
                    controller: _bodyController,
                    cursorColor: Colors.black,
                    maxLines: 1000,
                    decoration: const InputDecoration(
                        hintText: "Note text...",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
