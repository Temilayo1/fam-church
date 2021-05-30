import 'package:fam_church/screens/notes/db/notes_db.dart';
import 'package:fam_church/screens/notes/edit_notes.dart';
import 'package:fam_church/screens/notes/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteDetailsPage extends StatefulWidget {
  final int noteId;
  NoteDetailsPage({
    Key? key,
    required this.noteId,
  }) : super(key: key);

  @override
  _NoteDetailsPageState createState() => _NoteDetailsPageState();
}

class _NoteDetailsPageState extends State<NoteDetailsPage> {
  bool isLoading = false;
  late NoteModel note;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);
    // this.note = await NotesDatabase.instance.readNote(widget.note);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [editButton(), deleteButton()],
        // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.edit))],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(12),
              child: ListView(
                children: [
                  Text(
                    note.title,
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    DateFormat.yMMMd().format(note.createdTime),
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    note.description,
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
    );
  }

  Widget editButton() => IconButton(
      icon: Icon(Icons.edit),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EditNote(note: note),
        ));

        refreshNotes();
      });

  Widget deleteButton() => IconButton(
        onPressed: () async {
          await NotesDatabase.instance.delete(widget.noteId);
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.delete),
      );
}
