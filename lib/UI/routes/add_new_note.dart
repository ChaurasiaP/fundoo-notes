import 'package:flutter/material.dart';
import 'package:fundoo_notes_app/UI/main_screen.dart';
import 'package:fundoo_notes_app/UI/routes/display_note.dart';
import 'package:fundoo_notes_app/style/colors.dart';

class AddNewNote extends StatefulWidget {
  const AddNewNote({super.key});

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {

  TextEditingController headingController = TextEditingController();
  TextEditingController notesContentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Note..."),
      ),
      backgroundColor: routesBG,
      resizeToAvoidBottomInset: false, // to avoid pixels overflow error while opening the keyboard
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            // text field to get the heading of the note
            TextField(
              controller: headingController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Heading"
              ),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            ),
            // textfield area to get the content of the note
            SizedBox(
              height: MediaQuery.of(context).size.height*0.5,
              width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: notesContentController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                  hintText: "Enter your note"
                ),
              ),
            ),

            // create note button to save the data and display the note on another route
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayNote(heading: headingController.text, content: notesContentController.text)));
            },
                child: const Text("Create new note"))
          ],
        ),
      ),
    );
  }
}
