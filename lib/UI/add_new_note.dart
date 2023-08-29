import 'package:flutter/material.dart';
import 'package:fundoo_notes_app/services/sample_notes.dart';
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
      backgroundColor: allRoutesBG,
      resizeToAvoidBottomInset: false, // to avoid overflow while opening keyboard
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: ListView(children: [

              // enter heading for the note
              TextField(
                controller: headingController,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "Heading"),
                style:headingHintStyle,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                // enter the content for the note
                child: TextField(
                  // to be able to change line once the line is filled,
                  // maxLines is null so that it will automatically adjust the size as per the text input,

                  keyboardType: TextInputType.multiline, // this enables enter key in textfield keyboard
                  maxLines: null, // this will change the line automatically once the specified space is filled
                  controller: notesContentController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Enter your note...",hintStyle: hintTextStyle),
                ),
              ),

              // create note button, will route to the main screen and add the new note to the list
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
