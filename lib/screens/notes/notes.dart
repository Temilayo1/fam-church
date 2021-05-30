import 'package:fam_church/components/bottom_nav_bar.dart';
//import 'package:fam_church/components/navigation_drawer.dart';//
//import 'package:fam_church/screens/notes/add_list.dart';
import 'package:fam_church/screens/notes/db/notes_db.dart';
import 'package:fam_church/screens/notes/edit_notes.dart';
import 'package:fam_church/screens/notes/models/note_model.dart';
import 'package:fam_church/screens/notes/note_details.dart';
import 'package:fam_church/screens/notes/notecard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// ignore: use_key_in_widget_constructors
class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  late List<NoteModel> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.notes = await NotesDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff072736),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 1,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, size: 30),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavBar(),
      // drawer: NaviationDrawer(),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.black,
      //   child: Icon(Icons.add),
      //   onPressed: () async {
      //     await Navigator.of(context).push(
      //       MaterialPageRoute(builder: (context) => EditNote()),
      //     );

      //     refreshNotes();
      //   },
      // ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : notes.isEmpty
                ? Text(
                    'No Notes',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  )
                : build(context),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => EditNote()),
          );

          refreshNotes();
        },
      ),
    );

    Widget buildNotes() => StaggeredGridView.countBuilder(
          padding: EdgeInsets.all(8),
          itemCount: notes.length,
          staggeredTileBuilder: (index) => StaggeredTile.fit(2),
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemBuilder: (context, index) {
            final note = notes[index];

            return GestureDetector(
              onTap: () async {
                await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NoteDetailsPage(noteId: note.id!),
                ));

                refreshNotes();
              },
              child: NoteCardWidget(note: note, index: index),
            );
          },
        );
  }
}
