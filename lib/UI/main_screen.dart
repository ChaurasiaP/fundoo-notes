import 'package:flutter/material.dart';


class MainRoute extends StatefulWidget {
  const MainRoute({super.key});

  @override
  State<MainRoute> createState() => _MainRouteState();
}

class _MainRouteState extends State<MainRoute> {

  // declaring a global key to enable drawer expansion, where required
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  var widgetBG = Colors.white70;
  var widgetsColor = Colors.blue.shade900;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      key: _drawerKey,

      drawer: Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 250, width: 350,
              child: DrawerHeader(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(color: widgetsColor),
                child: Center(
                  child: Text("Fundoo Notes", style: TextStyle(
                    fontSize: 38, color: widgetBG
                  ),),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(18.0),
              child: ListTile(
                leading: Icon(Icons.account_circle,size: 50),
                title: Text("My Profile"),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(18.0),
              child: ListTile(
                leading: Icon(Icons.settings, size: 50,),
                title: Text("Settings"),
              ),
            )
          ],
        ),
      ),

      backgroundColor: Colors.lightBlueAccent,
      resizeToAvoidBottomInset: false,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 55,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: widgetBG,
              borderRadius: BorderRadius.circular(8.5)
            ),

            child: Row(
              children: <Widget>[
                IconButton(onPressed: () {
                  _drawerKey.currentState!.openDrawer();
                }, icon: Icon(Icons.menu, color: widgetsColor )
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  height: 55, width: 250,
                  decoration: const BoxDecoration(
                  ),

                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search Your Notes",
                    ),
                  ),
                ),

                IconButton(onPressed: (){}, icon: Icon(Icons.list, color: widgetsColor)),
                IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded, color: widgetsColor))

                  ],
                )
            ),
          ),
        ),
      );
  }
}
