import 'package:flutter/material.dart';
import 'package:fundoo_notes_app/style/colors.dart';


class DisplayNote extends StatelessWidget {
  final String heading;
  final String content;

  const DisplayNote({super.key, required this.heading, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(heading),
      ),
      backgroundColor: routesBG,
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.1),
        child: Text(content, style: const TextStyle(fontSize: 16),),
      ),
    );
  }
}
