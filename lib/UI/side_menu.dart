
import 'package:flutter/material.dart';
import 'package:fundoo_notes_app/UI/settings.dart';
import 'package:fundoo_notes_app/style/button_style.dart';
import 'package:fundoo_notes_app/style/colors.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: allRoutesBG,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              // drawer header content
              DrawerHeader(
                // always shown on left side of the menu bar

                decoration: BoxDecoration(color: Colors.blue.shade900,
                borderRadius: const BorderRadius.only(topRight: Radius.circular(100), bottomRight: Radius.circular(100))),
                child: const Center(
                  child: Text(
                    "Fundoo Notes",
                    style: TextStyle(fontSize: 28, color: Colors.white70, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // drawer header content ends
              const SizedBox(height: 14),
              // draw menu-bar items
              _myNotesSection(),
              const SizedBox(height: 14),
              _myArchivesSection(),
              const SizedBox(height: 14),
              TextButton(
                  style: buttonStyle,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SettingsRoute()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.settings, size: 25,color: Colors.white,),
                      const SizedBox(width: 30),
                      _sideMenuText("Settings")
                    ],
                  ))

              // drawer menu-bar items ends
            ],
          ),
        ),
    );
  }

  Widget _myNotesSection() =>
      TextButton(
        style: buttonStyle,
          onPressed: (){},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.lightbulb, size: 25,color: Colors.yellow,),
              const SizedBox(width: 30),
              _sideMenuText("My Notes")
            ],
          ));

  Widget _myArchivesSection() =>
      TextButton(
          style: buttonStyle,
          onPressed: (){},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.archive_outlined, size: 25, color: Colors.white,),
              const SizedBox(width: 30),
              _sideMenuText("My Archives")
            ],
          )
      ); 
  
  Widget _sideMenuText(String tabName) =>
      Text(tabName, style: const TextStyle(fontSize: 16,
          color: Colors.white, fontStyle: FontStyle.italic));
}
