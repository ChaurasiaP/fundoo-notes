
import 'package:flutter/material.dart';
import 'package:fundoo_notes_app/UI/routes/settings.dart';
import 'package:fundoo_notes_app/style/button_style.dart';
import 'package:fundoo_notes_app/style/colors.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: routesBG,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              // drawer header content
              DrawerHeader(
                // always shown on left side of the menu bar

                decoration: BoxDecoration(color: widgetsColor,
                borderRadius: const BorderRadius.only(topRight: Radius.circular(50), bottomRight: Radius.circular(50))),
                child: Center(
                  child: Text(
                    "Fundoo Notes",
                    style: TextStyle(fontSize: 28, color: widgetBG, fontWeight: FontWeight.bold),
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
                      const Icon(Icons.settings, size: 30,color: Colors.white,),
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
              const Icon(Icons.lightbulb, size: 30,color: Colors.yellow,),
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
              const Icon(Icons.archive_outlined, size: 30, color: Colors.white,),
              const SizedBox(width: 30),
              _sideMenuText("My Archives")
            ],
          )
      ); 
  
  Widget _sideMenuText(String tabName) =>
      Text(tabName, style: const TextStyle(fontSize: 18,
          color: Colors.white));
}
