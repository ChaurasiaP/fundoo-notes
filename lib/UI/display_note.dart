import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fundoo_notes_app/UI/edit_note.dart';
import 'package:fundoo_notes_app/UI/main_screen.dart';
import 'package:fundoo_notes_app/services/db.dart';
import 'package:fundoo_notes_app/services/firestore_db.dart';
import 'package:fundoo_notes_app/services/my_note_model.dart';
import 'package:fundoo_notes_app/style/colors.dart';

// to expand the selected note and view it completely

class DisplayNote extends StatelessWidget {
  final Note note;

  const DisplayNote({super.key, required this.note});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: allRoutesBG,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: activeTab),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const MainRoute()));
                      },
                      child: const Icon(Icons.arrow_back, color: Colors.white,)
                  ),
                  Text(note.title, style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                  Row(
                      children: [
                        InkWell(
                            onTap: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EditNote(note: note)));
                            },
                            child: const Icon(Icons.edit, color:  Colors.white)),
                        SizedBox(width: MediaQuery.of(context).size.width*0.04),
                        InkWell(
                          onTap: ()async {
                            await FirestoreDB.deleteNote(note.id);
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.04),
                        const Icon(Icons.push_pin,color: Colors.white,)
                      ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.1),
              child: Text(note.content, style: const TextStyle(fontSize: 16),),
            ),
          ],
        ),
      ),

    );
  }
}
