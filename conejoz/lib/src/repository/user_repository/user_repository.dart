import 'package:conejoz/src/features/authentication/models/rabbit_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createRabbit(Map<String, dynamic> rabbitDocument) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print("User is not authenticated.");
      return;
    }

    final uid = user.uid;

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

  Future<UserModel?> getUserDetails(String email) async {
    final querySnapshot =
        await _db.collection("rabbits").where("Email", isEqualTo: email).get();

    if (querySnapshot.size == 0) {
      // User not found in the "rabbits" collection
      return null;
    }

    // User found, return the UserModel
    return UserModel.fromSnapshot(querySnapshot.docs.first);
  }

  Future<void> updateUserDefaultJournal(String userId, String imageUrl) async {
    final defaultJournalRef = _db
        .collection("rabbits")
        .doc(userId)
        .collection("journals")
        .doc("default");

    try {
      await defaultJournalRef.update({"image_url": imageUrl});
    } catch (error) {
      print("Error updating user's default journal: $error");
      throw error;
    }
  }

  // This is a function that should help with the validation of the username. Not working yet.
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
  }

  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection("rabbits").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<String?> getRabbitNameByUserId() async {
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
}
  /*Future<void> updateUserRecord(UserModel user) async {
    await _db.collection("rabbits");
  }*/

