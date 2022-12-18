import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_with/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<User?> get authChanges => _auth.authStateChanges();
  User get user => _auth.currentUser!;

 Future<bool> signInUserWithEmail(BuildContext context,String emailAddress, String password) async{
    bool sign = false;
    try{
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress,
          password: password);
      User? user = credential.user;
      if(user != null){
        if(credential.additionalUserInfo!.isNewUser){
             await _firestore.collection("users").doc(user.uid).set({
                'username':user.displayName,
                "email": user.email,
                "uid":user.uid,
              });
        }
        sign = true;
      }

    }on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, '${e.message}');
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        showSnackBar(context, '${e.message}');
      }
      sign = false;
    }

    return sign;
}

    loginuserwithEmail(BuildContext context,String emailAddress, String password) async{
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password
        );



      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          showSnackBar(context, '${e.message}');
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          showSnackBar(context, '${e.message}');
          print('Wrong password provided for that user.');
        }
      }
    }

    logoutUser() async {
      await FirebaseAuth.instance.signOut();
    }



}