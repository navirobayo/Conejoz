import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// * This file performs CRUD operations on the "rabbits" collection in the database.
// * CRUD = Create, Read, Update, Delete

class UserRepository extends GetxController {
  static UserRepository get instance =>
      Get.find(); // This allows to use the controller anywhere in the app.

  final _db = FirebaseFirestore.instance;

  // * Functions used in multiple features:

  Future<DocumentSnapshot<Map<String, dynamic>>?> getUserDocument(
      // This function gets the user personal document from the "rabbits" collection.
      // This is the document that contains all of the dependencies of the user.
      String userId) async {
    try {
      final userDocumentRef = _db.collection("rabbits").doc(userId);
      final docSnapshot = await userDocumentRef.get();
      if (docSnapshot.exists) {
        return docSnapshot;
      } else {
        print("User document does not exist.");
        return null;
      }
    } catch (error) {
      print("Error getting user document: $error");
      return null;
    }
  }

  Future<String?> getRabbitNameByUserId() async {
    // This function gets the rabbit username by the user's unique id.
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print("User is not authenticated.");
      return null;
    }

    final uid = user.uid;

    try {
      final docSnapshot = await _db.collection("rabbits").doc(uid).get();
      if (docSnapshot.exists) {
        return docSnapshot.data()?["rabbitname"];
      } else {
        print("User document does not exist in the 'rabbits' collection.");
        return null;
      }
    } catch (error) {
      print("Error getting rabbit name by userId: $error");
      return null;
    }
  }

  // * Functions used in the "Authentication" feature:

  Future<void> createRabbit(Map<String, dynamic> rabbitDocument) async {
    // This function creates a new user in the "rabbits" collection.
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print("User is not authenticated.");
      return;
    }

    final uid = user.uid; // Get the user's unique id.

    await _db.collection("rabbits").doc(uid).set(rabbitDocument).then((_) {
      Get.snackbar("Success", "You are a rabbit now",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green);
    }).catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

  // * Functions used in the "Feed" feature:

  Future<void> makeEntryPublic(String userId, String entryId) async {
    try {
      // Get a reference to the user's entry
      final userDocumentRef =
          FirebaseFirestore.instance.collection("rabbits").doc(userId);
      final entrySnapshot = await userDocumentRef
          .collection("cloudjournal")
          .doc("entries")
          .collection(entryId)
          .get();

      if (entrySnapshot.docs.isNotEmpty) {
        final entryData = entrySnapshot.docs.first.data();

        // Create a new document in the publicdreams collection with the same ID as the entry
        await FirebaseFirestore.instance
            .collection("publicdreams")
            .doc(entryId)
            .set(entryData);
      } else {
        print("Entry does not exist.");
      }
    } catch (error) {
      print("Error making entry public: $error");
      throw error;
    }
  }

  // * Functions used in the "JournalManager" feature:

  Future<List<Map<String, dynamic>>> getUserEntries(String userId) async {
    // This function gets the user's journal entries from his personal document.
    final userDocument = await getUserDocument(userId);
    if (userDocument != null) {
      final cloudJournal = userDocument['cloudjournal'];
      if (cloudJournal != null) {
        final userEntries = <Map<String, dynamic>>[];
        final entries = cloudJournal['entries'] ?? {};
        entries.forEach((key, value) {
          final entry = Map<String, dynamic>.from(value);
          entry['uniqueid'] = key;
          userEntries.add(entry);
        });
        return userEntries;
      }
    }
    return [];
  }

  // * Functions used in the "Journal" feature:

  Future<void> addImageToUserGallery(String userId, String imageUrl) async {
    // This function adds the link of an image to the user's gallery directory.
    final userDocumentRef = _db.collection("rabbits").doc(userId);

    try {
      await userDocumentRef.update({
        "usergallery.userimages": FieldValue.arrayUnion([imageUrl]),
      });
    } catch (error) {
      print("Error adding image to user's gallery: $error");
      throw error;
    }
  }

  Future<void> saveNote(
      // This function saves the text entry of a dream to the user's journal.
      String userUniqueId,
      Map<String, dynamic> noteData) async {
    final userDocumentRef = _db.collection("rabbits").doc(userUniqueId);

    final entryId = noteData['entryid'];

    try {
      await userDocumentRef.update({
        "cloudjournal.entries.$entryId": noteData,
      });
    } catch (error) {
      print("Error saving note: $error");
      throw error;
    }
  }

  Future<void> updateEntry(
      // Updates Text entry
      String userId,
      String entryId,
      Map<String, dynamic> updatedEntryData) async {
    final userDocumentRef = _db.collection("rabbits").doc(userId);

    try {
      await userDocumentRef.update({
        "cloudjournal.entries.$entryId": updatedEntryData,
      });
    } catch (error) {
      print("Error updating entry: $error");
      throw error;
    }
  }

  Future<void> addPictureToEntry(
    // Adds picture to entry
    String userId,
    String entryId,
    String attachmentId,
  ) async {
    try {
      final userDocumentRef = _db.collection("rabbits").doc(userId);

      await userDocumentRef.update({
        "cloudjournal.entries.$entryId.attachments":
            FieldValue.arrayUnion([attachmentId]),
      });
    } catch (error) {
      print("Error adding picture to entry: $error");
      throw error;
    }
  }

  Future<void> createPublicDreamFromEntryDashboard(
      Map<String, dynamic> entryData) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      print("User is not authenticated.");
      return;
    }

    final entryId = entryData['entryid']; // Access the entry ID from entryData

    try {
      // Copy the data from the entry and add it to the publicdreams collection
      final publicDreamData = {
        "dreamimage": entryData['attachments']
                [0] ?? // Get the first attachment URL
            "https://firebasestorage.googleapis.com/v0/b/conejoz-0000.appspot.com/o/DREAM_PICTURES%2Fdream_image_1691514996955.jpg?alt=media&token=efc0c98e-0600-406e-a215-7bf0ce9c3e89",
        "rabbit": user.uid,
        "textentry": entryData['dreamdescription'],
        "entryid": entryData['entryid'],
        "tags": List<String>.from(entryData['tags'] ?? []),
        "timestamp": entryData['timestamp'],
        "title": entryData['title'],
      };

      await _db.collection("publicdreams").doc(entryId).set(publicDreamData);
      print("Public dream created successfully!");
    } catch (error) {
      print("Error creating public dream: $error");
      throw error;
    }
  }
}
