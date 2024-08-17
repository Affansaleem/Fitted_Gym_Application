import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices{

  final FirebaseAuth _auth= FirebaseAuth.instance;

  // Signup
  Future<User?> signUpWithEmailandPassword(String email, String password) async{

    try{
      UserCredential credential= await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }
    catch(e)
    {
      print("Some error occurred");
    }
    return null;
  }

  // signin method
  Future<User?> signInWithEmailandPassword(String email, String password) async{

    try{
      UserCredential credential= await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }
    catch(e)
    {
      print("Some error occurred");
    }
    return  null;
  }

}