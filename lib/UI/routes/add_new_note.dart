import 'package:flutter/material.dart';
import 'package:fundoo_notes_app/UI/routes/display_note.dart';
import 'package:fundoo_notes_app/notes_db/sample_notes.dart';
import 'package:fundoo_notes_app/style/colors.dart';
import 'package:fundoo_notes_app/style/text_style.dart';

class AddNewNote extends StatefulWidget {
  const AddNewNote({super.key});

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
  List<Note> notesList = Note.getSampleNotes();

  TextEditingController headingController = TextEditingController();
  TextEditingController notesContentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Note..."),
      ),
      backgroundColor: routesBG,
      resizeToAvoidBottomInset: false,
      // to avoid pixels overflow error while opening the keyboard
      body: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: ListView(children: [
              TextField(
                controller: headingController,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "Heading"),
                style:headingStyle,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  // to be able to change line once the line is filled,
                  // maxLines is null so that it will automatically adjust the size as per the text input,

                  keyboardType: TextInputType.multiline, // this enables enter key in textfield keyboard
                  maxLines: null, // this will change the line automatically once the specified space is filled
                  controller: notesContentController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Enter your note",hintStyle: contentStyle),
                ),
              ),

              // create note button to save the data and display the note on another route
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, [
                        headingController.text, notesContentController.text
                      ]);
                    },
                    child: const Text("Create new note")),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
