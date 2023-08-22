
import 'package:flutter/material.dart';
import 'package:fundoo_notes_app/UI/routes/settings.dart';
import 'package:fundoo_notes_app/style/colors.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  get context => null;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(

        child: SafeArea(
          child: Column(
            children: <Widget>[
              // drawer header content
              DrawerHeader(
                // always shown on left side of the menu bar

                decoration: BoxDecoration(color: widgetsColor),
                child: Center(
                  child: Text(
                    "Fundoo Notes",
                    style: TextStyle(fontSize: 28, color: widgetBG, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // drawer header content ends

              // draw menu-bar items
              _sectionOne(),
              const SizedBox(height: 14),
              _sectionTwo(),
              const SizedBox(height: 14),
              _sectionThree(),

              // drawer menu-bar items ends
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionOne() =>
      TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.cyanAccent),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50)
            )
        ))

        ),
          onPressed: (){},
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.lightbulb_outline_rounded, size: 30),
              SizedBox(width: 30),
              Text("My Notes",style: TextStyle(fontSize: 18),)
            ],
          ));

  Widget _sectionTwo() =>
      TextButton(
          style: ButtonStyle(

              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50)
                  )
              ))

          ),
          onPressed: (){},
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.archive_outlined, size: 30),
              SizedBox(width: 30),
              Text("My Archives",style: TextStyle(fontSize: 18),)
            ],
          ));

  Widget _sectionThree() =>
      TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50)
                  )
              ))

          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsRoute()));
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.settings, size: 30),
              SizedBox(width: 30),
              Text("Settings",style: TextStyle(fontSize: 18),)
            ],
          ));
}
