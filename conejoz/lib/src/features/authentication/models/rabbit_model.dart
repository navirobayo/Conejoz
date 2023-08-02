import 'package:cloud_firestore/cloud_firestore.dart';

class RabbitModel {
  final String? id;
  final String rabbit;
  final String email;
  final String password;

  const RabbitModel({
    this.id,
    required this.rabbit,
    required this.email,
    required this.password,
  });

  toJson() {
    return {"Rabbit": rabbit, "Email": email, "Password": password};
  }

  factory RabbitModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return RabbitModel(
      id: document.id,
      email: data["Email"],
      password: data["Password"],
      rabbit: data["Rabbit"],
    );
  }
}
