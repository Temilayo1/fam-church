import 'package:fam_church/components/bottom_nav_bar.dart';
import 'package:fam_church/components/navigation_drawer.dart';
import 'package:fam_church/screens/notes/add_list.dart';
import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavBar(),
      drawer: NaviationDrawer(),
      floatingActionButton: FloatingActionButton(
        // disabledElevation: true,
        hoverColor: Colors.red,
        focusColor: Colors.yellow,
        backgroundColor: Colors.grey,
        tooltip: 'Add a note',
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddList(),
            ),
            isScrollControlled: true,
          );
        },
        child: Icon(
          Icons.edit_outlined,
          size: 30,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // SizedBox(
              //   height: 90,
              // ),
              Container(
                decoration: BoxDecoration(
                  //  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                //color: Colors.black,
                height: size.height / 4,
              ),
              SizedBox(height: 25),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                height: size.height / 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
