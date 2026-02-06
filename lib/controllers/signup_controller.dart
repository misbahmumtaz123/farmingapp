import 'package:farmingapp/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signup(AppUser user, String password) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: user.email,
      password: password,
    );

    final newUser = AppUser(
      uid: credential.user!.uid,
      name: user.name,
      email: user.email,
    );

    await _firestore.collection('users').doc(newUser.uid).set(newUser.toMap());
  }
}
