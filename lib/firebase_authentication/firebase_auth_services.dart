import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitted/reusable/toast.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Signup
  Future<User?> signUpWithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        showToast(message: "Email Already In Use");
      }
      print("Some error occurred");
    }
    return null;
  }

  // signin method
  Future<User?> signInWithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showToast(message: "Invalid Email or Password");
      } else {
        showToast(message: "An Error Occurred");
      }
    }
    return null;
  }
}

class DatabaseMethods {
  Future addEmployee(Map<String, dynamic> employeeInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(id)
        .set(employeeInfoMap);
  }

  Future<Map<String, dynamic>?> getEmployee(String id) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection("Users")
        .doc(id)
        .get();

    return doc.exists ? doc.data() as Map<String, dynamic>? : null;
  }
}
