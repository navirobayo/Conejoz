import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// * CRUD related operations for the app.
// * CRUD = Create, Read, Update, Delete.

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

  Future<void> createPublicDream(Map<String, dynamic> entryData) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      print("User is not authenticated.");
      return;
    }

    final entryId = entryData['entryid']; // Access the entry ID from entryData

    try {
      // Get the rabbit name by the user's unique ID
      final rabbitName = await getRabbitNameByUserId();

      // Copy the data from the entry and add it to the publicdreams collection
      final attachments = entryData['attachments'];
      final dreamImage = attachments != null && attachments.isNotEmpty
          ? attachments[0]
          : 'https://firebasestorage.googleapis.com/v0/b/conejoz-0000.appspot.com/o/DREAM_PICTURES%2FNo%20attachments.png?alt=media&token=94eef887-5b6a-4a24-ab37-2ac1797f1560';
      final publicDreamData = {
        "dreamimage": dreamImage,
        "rabbit":
            rabbitName, // Store the rabbit name instead of the user unique ID
        "textentry": entryData['dreamdescription'],
        "entryid": entryData['entryid'],
        "tags": List<String>.from(entryData['tags'] ?? []),
        "timestamp": entryData['timestamp'],
        "title": entryData['title'],
        "attachments": List<String>.from(entryData['attachments']) ?? [],
      };

      await _db.collection("publicdreams").doc(entryId).set(publicDreamData);
      print("Public dream created successfully!");
    } catch (error) {
      print("Error creating public dream: $error");
      throw error;
    }
  }

  Future<void> deletePublicDream(String entryId) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      print("User is not authenticated.");
      return;
    }

    try {
      await _db.collection("publicdreams").doc(entryId).delete();
      print("Public dream deleted successfully!");
    } catch (error) {
      print("Error deleting public dream: $error");
      throw error;
    }
  }

  Future<String> fetchEntryStatus(String entryId) async {
    final docSnapshot = await FirebaseFirestore.instance
        .collection("publicdreams")
        .doc(entryId)
        .get();

    if (docSnapshot.exists) {
      return "Public";
    } else {
      return "Private";
    }
  }

  // * Functions used in the "JournalManager" feature:

  Future<List<Map<String, dynamic>>> getUserEntries(String userId) async {
    // This function gets the user's journal entries from his personal document.
    final userDocument = await getUserDocument(userId);
    if (userDocument != null) {
      final userEntries = <Map<String, dynamic>>[];
      final entries = userDocument['entries'] ?? {};
      entries.forEach((key, value) {
        final entry = Map<String, dynamic>.from(value);
        entry['uniqueid'] = key;
        userEntries.add(entry);
      });
      return userEntries;
    }
    return [];
  }

  // * Functions used in the "Journal" feature:

  Future<void> addImageToUserGallery(String userId, String imageUrl) async {
    // This function adds the link of an image to the user's gallery directory.
    final userDocumentRef = _db.collection("rabbits").doc(userId);

    try {
      await userDocumentRef.update({
        "userimages": FieldValue.arrayUnion([imageUrl]),
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
        "entries.$entryId": noteData,
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
        "entries.$entryId": updatedEntryData,
      });
    } catch (error) {
      print("Error updating entry: $error");
      throw error;
    }
  }

  Future<void> updatePublicEntry(String userId, String entryId,
      Map<String, dynamic> updatedEntryData) async {
    final userDocumentRef = _db.collection("publicdreams").doc(entryId);

    try {
      final userDocument = await userDocumentRef.get();
      if (userDocument.exists) {
        await userDocumentRef.update(updatedEntryData);
      } else {
        print("Document does not exist.");
      }
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
        "entries.$entryId.attachments": FieldValue.arrayUnion([attachmentId]),
      });
    } catch (error) {
      print("Error adding picture to entry: $error");
      throw error;
    }
  }

  Future<void> addPictureToPublicEntry(
    String userId,
    String entryId,
    String attachmentId,
  ) async {
    try {
      final userDocumentRef = _db.collection("publicdreams").doc(entryId);
      final userDocument = await userDocumentRef.get();
      if (userDocument.exists) {
        await userDocumentRef.update({
          "attachments": FieldValue.arrayUnion([attachmentId]),
        });
      } else {
        print("Document does not exist.");
      }
    } catch (error) {
      print("Error adding picture to entry: $error");
      throw error;
    }
  }
}
