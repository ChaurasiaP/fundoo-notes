import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fundoo_notes_app/UI/add_new_note.dart';
import 'package:fundoo_notes_app/UI/display_note.dart';
import 'package:fundoo_notes_app/UI/side_menu.dart';
import 'package:fundoo_notes_app/services/firestore_db.dart';
import 'package:fundoo_notes_app/services/login_info.dart';
import 'package:fundoo_notes_app/services/sample_notes.dart';
import 'package:fundoo_notes_app/style/colors.dart';
import 'package:fundoo_notes_app/style/text_style.dart';

class MainRoute extends StatefulWidget {
  const MainRoute({super.key});

  @override
   State<MainRoute> createState() => _MainRouteState();
}

class _MainRouteState extends State<MainRoute> {


  List<Note> notesList = Note.getSampleNotes();

  // declaring a global key to enable drawer expansion, where required
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  Future createNewNote() async{
    await FirestoreDB().createNewNoteFirestore("sdf", "34");
  }
  Future updateNote() async{
    await FirestoreDB().updateNote("Sixth title", "this is the Sixth demo content of the new heading", FirebaseAuth.instance.currentUser!.email.toString(), "2");
  }
  Future readAllNotes() async{
    await FirestoreDB().readAllNotes("sd");
  }
  Future deleteNote() async{
    await FirestoreDB().deleteNote("sd", "Dsf");
  }


  @override
  void initState(){
    super.initState();
    createNewNote();
    readAllNotes();
    updateNote();
    deleteNote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,

      // drawer menu-bar code
      drawer: const SideMenu(),
      // drawer menu-bar ends

      backgroundColor: allRoutesBG,

      body: SafeArea(
        // wrapped into SafeArea widget display content below the notch area
        child: Container(
          alignment: Alignment.topLeft,
          child: Column(children: [
            Container(
              // title bar
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration(
                  color: searchBarBG, borderRadius: BorderRadius.circular(8.5)),

              //title bar items wrapped under row, since, they are to be displayed in a row
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _drawerBarIcon(),
                  _searchBar(),
                  _changeViewMode(),
                  _searchButton()
                ],
              ),
            ),
            const SizedBox(height: 25),
            _displayNotes(),
          ]),
        ),
      ),
      // floating action button (+) to create new note
      floatingActionButton: FloatingActionButton.small(
        onPressed: () async {
          final result = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const AddNewNote())
          ); // routing to another screen ( AddNewNote() ) to add new note
          if(result != null){
            setState(() {
              notesList.add(Note(id: notesList.length, title: result[0], content: result[1], lastUpdatedTime: DateTime.now()));
            });
           }
        },
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }

  // user defined widget returning functions

  // title bar widgets
  Widget _drawerBarIcon() => IconButton(
      onPressed: () {
        _drawerKey.currentState!.openDrawer();
      },
      icon: Icon(Icons.menu, color: buttonsColor));

  // search bar
  Widget _searchBar() => Container(
        alignment: Alignment.centerLeft,
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: const BoxDecoration(),
        child: const TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search Your Notes",
          ),
        ),
      );

  // switch to list/tab view
  Widget _changeViewMode() =>
      IconButton(onPressed: () {}, icon: Icon(Icons.list, color: buttonsColor));

// search icon
  Widget _searchButton() =>
      IconButton(
      onPressed: () {}, icon: Icon(Icons.search_rounded, color: buttonsColor));

  Widget _displayNotes() => Expanded(
        child: MasonryGridView.count(
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            itemCount: notesList.length,
            crossAxisCount: 2,
            itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DisplayNote(
                                heading: notesList[index].title,
                                content: notesList[index].content)));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                           color: _colorGenerator(),
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(7.5)),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notesList[index].title,
                            style: headingStyle,
                            textDirection: TextDirection.ltr,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            notesList[index].content,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: contentStyle,
                          ),
                          const SizedBox(height: 10),
                          Text(
                              "last modified:\n ${notesList[index].lastUpdatedTime.toString().substring(0, 16)}",
                              style: subtitleTextStyle),
                        ],
                      )
                  ),
                )
        ),
      );

  Color? _colorGenerator() {
    var value = Random().nextInt(notesColors.length);
    return notesColors[value];
  }
}
