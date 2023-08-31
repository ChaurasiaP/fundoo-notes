import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/cupertino.dart";

// CRUD operations with firebase
class FirestoreDB{

  final FirebaseAuth _auth = FirebaseAuth.instance;


  /*
  WHAT IS USED IN THE CODE AND WHY AND HOW:-
  FirebaseFirestore.instance.collection("TAKES THE DATABASE WHICH IS TO BE CONSIDERED FOR THE OPERATION").doc("TAKES THE DETAILS OF THE USER, FOR WHOM THE DATA IS TO BE ACCESSED").
  collection("TAKES WHICH SUB-COLLECTION IS TO BE SELECTED").doc("GENERALLY TAKES INTEGER ID/ DOCUMENT ID OF THE DOC TO BE ACCESSED").SELECT THE OPERATION TO BE PERFORMED ACCORDINGLY .
  then("performs the action which is required to be executed after the previous tasks are done");

  NOTE: if the doc id is duplicate it will over-write the data, if its unique, it will create new data
   */

  // CREATE new note method, stored at firebase -> cloud firestore
  createNewNoteFirestore(gmail, id) async{
    await FirebaseFirestore.instance.
    collection("notes").doc(_auth.currentUser!.email).
    collection("userNotes").doc("4").
    set(
        {
          "Title": "Fourth Note",
          "content": "this is the content of the fourth note added using IDE command",
          "date modified": DateTime.now()
        }).then((_) {
         debugPrint("note added successfully");
    });
  }

  // READ operation
  readAllNotes(gmail) async{
    await FirebaseFirestore.instance.
    collection("notes").doc(_auth.currentUser!.email).
    collection("userNotes").orderBy("date modified" ).get().
    then((querySnapshot){
      querySnapshot.docs.forEach((result) {
        debugPrint(result.data().toString());
      });
    });
  }

  // UPDATE operation
  updateNote(String title, String content, String gmail, String id) async{
    await FirebaseFirestore.instance.
    collection("notes").doc(_auth.currentUser!.email).
    collection("userNotes").doc("2").
    update({"Title": title, "content": content, "date modified": DateTime.now() }).then((_) => debugPrint("Data modified successfully"));
  }

  // DELETE operation
  deleteNote(gmail, id) async{
    await FirebaseFirestore.instance.
    collection("notes").doc(_auth.currentUser!.email).
    collection("userNotes").doc("2").delete().then((_) => debugPrint("DATA DELETED SUCCESSFULLY"));
  }
}