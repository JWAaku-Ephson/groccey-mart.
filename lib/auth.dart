import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final FirebaseFirestore createUser = FirebaseFirestore.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // ---[CRUD = (Create, Read, Update, Delete)]
  addUser(
      {required String userName, required String emial, required int phone}) {
    return createUser.collection("Users").doc(currentUser!.uid).set({
      "userName": userName,
      "email": emial,
      "phone": phone,
    });
  }

  final CollectionReference _users =
      FirebaseFirestore.instance.collection("Users");
  Future<void> update(
      {String? userName,
      String? email,
      String? location,
      int? phone,
      String? birthDate}) async {
    await _users.doc(currentUser!.uid).set({
      "userName": userName,
      "email": email,
      "location": location,
      "phone": phone,
      "birthDate": birthDate
    }, SetOptions(merge: true));
  }

  Future<void> deleteDoc() async {
    await _users.doc(currentUser!.uid).delete();
  }
}
