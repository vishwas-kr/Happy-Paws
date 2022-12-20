import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:happy_paws/model/petModel.dart';
import 'package:happy_paws/model/user_model.dart';

class FirebaseData {
  final _db = FirebaseFirestore.instance;

  Future<PetModel> getPetData(String uid) async {
    var data;
    try {
      var response = await _db.collection("petDetails").doc(uid).get();

      data = PetModel.fromMap(response.data());
      print(data);
    } on FirebaseException catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
    return data;
  }

  Future<UserModel> getUserProfile(String uid) async {
    var data;
    try {
      var response = await _db.collection("users").doc(uid).get();

      data = UserModel.fromMap(response.data());
      print(data);
    } on FirebaseException catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
    return data;
  }
}
