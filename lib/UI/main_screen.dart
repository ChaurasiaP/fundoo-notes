import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fundoo_notes_app/UI/routes/add_new_note.dart';
import 'package:fundoo_notes_app/UI/side_menu.dart';
import 'package:fundoo_notes_app/style/colors.dart';
import 'package:sqflite/sqflite.dart';

class MainRoute extends StatefulWidget {
  const MainRoute({super.key});

  @override
  State<MainRoute> createState() => _MainRouteState();
}

class _MainRouteState extends State<MainRoute> {
  // declaring a global key to enable drawer expansion, where required
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  String headingNote = "Heading";
  String notesContent = "lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,

      // drawer menu-bar code
      drawer: const SideMenu(),
      // drawer menu-bar ends

      backgroundColor: Colors.lightBlueAccent,
      resizeToAvoidBottomInset: false,

      floatingActionButton:FloatingActionButton.small(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute
            (builder: (context) => AddNewNote()));
          },

      child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Container(
          alignment: Alignment.topLeft,
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                // title bar
                height: 55,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: widgetBG, borderRadius: BorderRadius.circular(8.5)),

                //title bar items wrapped under row, since, they are to be displayed in a row
                child: Row(
                  children: <Widget>[
                    _drawerBarIcon(),
                    _searchBar(),
                    _changeViewMode(),
                    _searchButton()
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: const Column(
                  children: [Text("All")],
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  mainScreenSection(),
                  mainScreenSection(),
                  mainScreenSection(),
                  mainScreenSection(),
                  mainScreenSection(),
                  mainScreenSection(),
                  mainScreenSection(),
                  mainScreenSection(),
                  mainScreenSection(),
                  mainScreenSection(),
                  mainScreenSection(),
                  mainScreenSection(),
                ],
              )
            ]
            ),
          ),
        ),
      ),
    );
  }

  // user defined widget returning functions
  Widget _drawerBarIcon() => IconButton(
      onPressed: () {
        _drawerKey.currentState!.openDrawer();
      },
      icon: Icon(Icons.menu, color: widgetsColor));

  Widget _searchBar() => Container(
        alignment: Alignment.centerLeft,
        height: 55,
        width: 250,
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

  Widget _searchButton() => IconButton(
      onPressed: () {}, icon: Icon(Icons.search_rounded, color: widgetsColor));

  // notes section on main screen
  Widget mainScreenSection() =>
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(7.5)
        ),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Text(headingNote, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),textDirection: TextDirection.ltr,),
              Text(notesContent)

              // TextField(
              //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              // ),
              // TextField(
              //   decoration: InputDecoration(
              //       border: InputBorder.none
              //   ),
              // ),
            ],
          )
      );
}



