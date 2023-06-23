import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Users with ChangeNotifier {
  final db = FirebaseFirestore.instance;

  TextEditingController namaController = TextEditingController();
  TextEditingController prodiController = TextEditingController();

  void addUser() {
    if (namaController.text.isNotEmpty && prodiController.text.isNotEmpty) {
      CollectionReference users = db.collection("users");
      users.add({
        'nama': namaController.text,
        'prodi': prodiController.text,
      });
      namaController.clear();
      prodiController.clear();
    } else {
      print("Data Kosong");
    }
  }

  Future<QuerySnapshot<Object?>> getUsers() async {
    CollectionReference users = db.collection("users");
    return await users.get();
  }

  Stream<QuerySnapshot<Object?>> streamUsers() {
    CollectionReference users = db.collection("users");
    return users.snapshots();
  }
}
