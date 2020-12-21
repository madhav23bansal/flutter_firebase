import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create User Object from firebase user
  CustomUser _userFromFirebaseUser(User user) {
    return user != null ? CustomUser(uid: user.uid) : null;
  }

  //Auth Change user stream
  Stream<CustomUser> get user {
    return _auth.onAuthStateChanged
        // .map((User user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  // signIn Anonymously
  Future signInAnonmously() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      print(userCredential.user.runtimeType);
      return _userFromFirebaseUser(userCredential.user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  //Signin With email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebaseUser(userCredential.user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  //Register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return _userFromFirebaseUser(userCredential.user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  //signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (err) {
      print(err.toString());
      return null;
    }
  }
}
