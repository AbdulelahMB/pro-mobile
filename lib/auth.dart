import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class auth {
  static String name = '';
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Auth_SignIn(String emailAddress, String password) async {
  var _auth = FirebaseAuth.instance;

  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    String uid = userCredential.user!.uid;
    auth.name =
        (await _firestore.collection('users').doc(uid).get()).get('name');

    return true; // Return true on successful sign-in
  } catch (e) {
    print(e);
    return false; // Return false on unexpected errors
  }
}

Auth_SignUp(String emailAddress, String password, String name) async {
  var _auth = FirebaseAuth.instance;

  try {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );

    final uid = credential.user!.uid;
    final usersCollection = FirebaseFirestore.instance.collection('users');
    final userDoc =
        usersCollection.doc(uid); // Replace 'userID' with the actual user ID
    userDoc
        .set({'name': name}); // Replace 'userName' with the actual user's name

    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    return false; // Return false on sign-in failure
  } catch (e) {
    print(e);
  }
  return false; // Return false on sign-in failure
}

Auth_Reset(String emailAddress) async {
  var _auth = FirebaseAuth.instance;
  try {
    final credential = await _auth.sendPasswordResetEmail(email: emailAddress);
    return credential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}
