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

  // * Functions used in the "Text Entry" feature:

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

  // * Functions used in the "Profile" feature:

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

  //* Update entries TEXT

  Future<void> updateEntry(String userId, String entryId,
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

  //* Update entries IMAGE

  Future<void> addAttachmentToEntry(
    // ! Not working. Do not use.
    String userId,
    String entryId,
    String imageUrl,
  ) async {
    try {
      final userDoc = _db.collection('rabbits').doc(userId);
      final entryDoc = userDoc
          .collection('cloudjournal')
          .doc('entries')
          .collection(entryId)
          .doc();

      await entryDoc.update({
        'attachments': FieldValue.arrayUnion([imageUrl]),
      });
    } catch (error) {
      print("Error adding attachment to entry: $error");
      throw error;
    }
  }

  Future<void> deleteAttachmentFromEntry(
      // ! Posibly faulty. Do not use.
      String userId,
      String entryId,
      String attachmentId) async {
    try {
      final userDoc = _db.collection('rabbits').doc(userId);
      final entryDoc = userDoc
          .collection('cloudjournal')
          .doc(entryId)
          .collection('attachments')
          .doc(attachmentId);

      await entryDoc.delete();
    } catch (error) {
      print("Error deleting attachment from entry: $error");
      throw error;
    }
  }

  Future<void> addPictureToEntry(
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
}
