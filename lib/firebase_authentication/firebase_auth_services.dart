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
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection("Users").doc(id).get();

    return doc.exists ? doc.data() as Map<String, dynamic>? : null;
  }

  Future<void> addWorkouts(Map<String, dynamic> workoutInfoMap) async {
    try {
      DocumentReference docRef = FirebaseFirestore.instance.collection('Workouts').doc();
      await docRef.set({
        ...workoutInfoMap,
        'documentId': docRef.id,
      });
      print("Workout added successfully with ID: ${docRef.id}");
    } catch (e) {
      print('Error adding workout: $e');
    }
  }

  // To retrieve all data from workouts collection
  Future<List<Map<String, dynamic>>> fetchWorkouts() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Workouts').get();
    List<Map<String, dynamic>> workouts = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
    return workouts;
  }

  Future<void> deleteWorkout(String workoutId) async {
    try {
      print(workoutId);
      await FirebaseFirestore.instance
          .collection('Workouts') // Your collection name
          .doc(workoutId) // The ID of the document you want to delete
          .delete();
      print('Document deleted successfully.');
    } catch (e) {
      print('Error deleting document: $e');
    }
  }



}
