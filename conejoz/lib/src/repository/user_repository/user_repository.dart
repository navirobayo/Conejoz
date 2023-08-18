import 'package:conejoz/src/repository/models/rabbit_model.dart';
import 'package:conejoz/src/repository/authentication_repository/authentication_repository.dart';
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
      // This function gets the user document from the "rabbits" collection.
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

  // * Functions used in the "Profile" feature:

  Future<UserModel?> getUserDetails(String email) async {
    // This function gets the user details from the "rabbits" collection.
    // Specifically, it gets the user details by email.
    final querySnapshot =
        await _db.collection("rabbits").where("Email", isEqualTo: email).get();

    if (querySnapshot.size == 0) {
      return null;
    }
    return UserModel.fromSnapshot(querySnapshot.docs.first);
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

  // * Functions used in the "Feed Screen " feature:
  void postDream(String message, String caption) {
    // Not implemented yet.
    // TODO: Edit so it can send a string with the username.
    FirebaseFirestore.instance.collection("publicdreams").add({
      "Rabbit": "username", // Fix this.
      "Dream": message,
      "Title": "Title",
      "TimeStamp": DateTime.now(),
      "Caption": caption,
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

  // * Functions used in the "Dream Creator" feature:

  // * Functions used in the "Dream File Creator" feature:

  Future<void> saveNote(
      // This function saves the text entry of a dream to the user's journal.
      String userUniqueId,
      Map<String, dynamic> noteData) async {
    final userDocumentRef = _db.collection("rabbits").doc(userUniqueId);

    try {
      await userDocumentRef.update({
        "cloudjournal.entries": FieldValue.arrayUnion([noteData]),
      });
    } catch (error) {
      print("Error saving note: $error");
      throw error;
    }
  }

  Future<void> addTagsToDream(String userUniqueId, List<String> tags) async {
    // This function adds tags to the dream object that is being created.
    // ! Not tested yet.
    final userDocumentRef = _db.collection("rabbits").doc(userUniqueId);

    try {
      await userDocumentRef.update({
        "cloudjournal.tags": FieldValue.arrayUnion(tags),
      });
    } catch (error) {
      print("Error adding tags to dream: $error");
      throw error;
    }
  }

  Future<Map<String, dynamic>?> getLastJournalEntry() async {
    // This function gets the last journal entry of the user.
    // ! This seems to not work at the moment.
    final user = AuthenticationRepository.instance.firebaseUser.value;
    if (user != null) {
      final userId = user.uid;
      final userDocument = await getUserDocument(userId);
      if (userDocument != null) {
        final journalEntries = List<Map<String, dynamic>>.from(
            userDocument['defaultjournal']['entries']);
        if (journalEntries.isNotEmpty) {
          return journalEntries.last;
        }
      }
    }
    return null;
  }

  Future<String?> getLastUserImage() async {
    // This function gets the last image uploaded by the user.
    // ! This seems to not work at the moment.
    final user = AuthenticationRepository.instance.firebaseUser.value;
    if (user != null) {
      final userId = user.uid;
      final userDocument = await getUserDocument(userId);
      if (userDocument != null) {
        final userImageUrls =
            List<String>.from(userDocument['usergallery']['userimages']);
        if (userImageUrls.isNotEmpty) {
          return userImageUrls.last;
        }
      }
    }
    return null;
  }
}

// Not used. But can be used to get user details by username.
/*
  Future<UserModel?> getUserDetailsByUsername(String username) async {
    try {
      final snapshot = await _db
          .collection("rabbits")
          .where("rabbitname", isEqualTo: username)
          .limit(1)
          .get();

      if (snapshot.docs.isEmpty) {
        return null; // Username does not exist
      }

      final userData = snapshot.docs.first;
      return UserModel.fromSnapshot(userData);
    } catch (error) {
      print("Error getting user details by username: $error");
      return null;
    }
  } */

/*
  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection("rabbits").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }
  */
