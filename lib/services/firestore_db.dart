import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/cupertino.dart";

// CRUD operations with firebase
class FirestoreDB{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create new note method, stored at firebase -> cloud firestore
  createNewNoteFirestore(gmail, id) async{
    await FirebaseFirestore.instance.collection("notes").doc(_auth.currentUser!.email).collection("userNotes").doc("2").set(
        {
          "Title": "Second Note",
          "content": "this is the content of the second note added using IDE command",
          "date modified": DateTime.now()
        }).then((_) {
         debugPrint("note added successfully");
    });
  }

  // Read operation
  readAllNotes(gmail) async{
    await FirebaseFirestore.instance.collection("notes").doc(_auth.currentUser!.email).collection("userNotes").orderBy("date modified" ).get().then((querySnapshot){
      querySnapshot.docs.forEach((result)
      {
        debugPrint(result.data().toString());
      });
    });
  }

}