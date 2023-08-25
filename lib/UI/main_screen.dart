import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fundoo_notes_app/UI/routes/add_new_note.dart';
import 'package:fundoo_notes_app/UI/routes/display_note.dart';
import 'package:fundoo_notes_app/UI/side_menu.dart';
import 'package:fundoo_notes_app/services/db.dart';
import 'package:fundoo_notes_app/style/colors.dart';

class MainRoute extends StatefulWidget {
  const MainRoute({super.key});

  @override
  State<MainRoute> createState() => _MainRouteState();
}

class _MainRouteState extends State<MainRoute> {

  // declaring a global key to enable drawer expansion, where required
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  // hard coded values for notes heading and notes content
  String headingNote = "Heading";
  String notesContent =
      "lorem ipsum";
  String notesContent2 ="lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum ";

  // async function to create new entry
  Future createEntry() async{
    await NotesDataBase.instance.create();
  }

  // async function to print notes on console
  Future<String?> getAllNotes() async{
    await NotesDataBase.instance.readAllNotes();
  }

  // async function to get details of a particular note, using its content or title or ID
  Future<String?> readOneNote() async{
    await NotesDataBase.instance.readOneNote(12);
}
Future<int?> updateNote() async{
    await NotesDataBase.instance.updateNotes(4);
}
Future deleteNote() async{
    await NotesDataBase.instance.deleteNote(3);
}
  @override
  void initState(){
    super.initState();
    createEntry();
    getAllNotes();
    readOneNote();
    updateNote();
    getAllNotes();
    deleteNote();
    getAllNotes();
  }

  int index = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,

      // drawer menu-bar code
      drawer: const SideMenu(),
      // drawer menu-bar ends

      backgroundColor: Colors.lightBlueAccent,

      // floating action button (+) to create new note
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddNewNote())); // routing to another screen ( AddNewNote() ) to add new note
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea( // wrapped into SafeArea widget display content below the notch area
        child: Container(
          alignment: Alignment.topLeft,
          child: SingleChildScrollView( // to avoid pixel overflow error, if occurs
            child: Column(children: [
              Container(
                // title bar
                height: MediaQuery.of(context).size.height*0.08,
                width: MediaQuery.of(context).size.width,

                decoration: BoxDecoration(
                    color: widgetBG,
                    borderRadius: BorderRadius.circular(8.5)),

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
              // Container(
              //   alignment: Alignment.topLeft,
              //   margin:
              //       const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              //   child: const Column(
              //     children: [Text("All")],
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: StaggeredGrid.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  children: [
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 3,
                        child: mainScreenSection("inside the box one lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum ")),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: mainScreenSection("inside the box two")),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: mainScreenSection("inside the box three")),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: mainScreenSection("inside the box four")),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: mainScreenSection("inside the box four")),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 3,
                        child: mainScreenSection("inside the box five")),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: mainScreenSection("inside the box six")),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: mainScreenSection("inside the box seven")),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 3,
                        child: mainScreenSection("inside the box eight")),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: mainScreenSection("inside the box nine")),

                  ],
                ),
              )
            ]),
          ),
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
      icon: Icon(Icons.menu, color: widgetsColor));
  // search bar
  Widget _searchBar() => Container(
        alignment: Alignment.centerLeft,
        height: MediaQuery.of(context).size.height*0.5,
        width: MediaQuery.of(context).size.width*0.5,
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
      IconButton(onPressed: () {}, icon: Icon(Icons.list, color: widgetsColor));
// search icon
  Widget _searchButton() => IconButton(
      onPressed: () {}, icon: Icon(Icons.search_rounded, color: widgetsColor));

  // display notes section on main screen
  Widget mainScreenSection(String content) => InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayNote(heading: headingNote, content: content)));
      debugPrint(content.length.toString()); // display notes on full screen on tapping the note
    },
    splashColor: Colors.blue[900],
    child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(7.5)),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              headingNote,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              textDirection: TextDirection.ltr,
            ),
            SizedBox(height: 10),

            Text(content,
            overflow: TextOverflow.ellipsis,
            maxLines: 10),

            // TextField(
            //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            // ),
            // TextField(
            //   decoration: InputDecoration(
            //       border: InputBorder.none
            //   ),
            // ),
          ],
        )),
  );

}
