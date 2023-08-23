import 'package:flutter/material.dart';


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
      body: Column(
        children: [
          Text(heading, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
        ],
      ),
    );
  }
}
