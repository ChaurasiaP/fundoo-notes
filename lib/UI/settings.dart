import 'package:flutter/material.dart';
import 'package:fundoo_notes_app/style/colors.dart';

class SettingsRoute extends StatelessWidget {
  const SettingsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      backgroundColor: allRoutesBG,
    );
  }
}
