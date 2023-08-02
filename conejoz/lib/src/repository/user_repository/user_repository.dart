import 'package:conejoz/src/features/authentication/models/rabbit_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(RabbitModel user) async {
    await _db.collection("rabbits").add(user.toJson()).whenComplete(() {
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

  Future<RabbitModel> getRabbitDetails(String email) async {
    final snapshot =
        await _db.collection("rabbits").where("Email", isEqualTo: email).get();
    final userData =
        snapshot.docs.map((e) => RabbitModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<RabbitModel>> allUser() async {
    final snapshot = await _db.collection("rabbits").get();
    final userData =
        snapshot.docs.map((e) => RabbitModel.fromSnapshot(e)).toList();
    return userData;
  }

  /*Future<void> updateRabbitRecord(RabbitModel user) async {
    await _db.collection("rabbits");
  }*/
}
