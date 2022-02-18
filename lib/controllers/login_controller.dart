import 'package:barbearia_project/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_controller.dart';

class LoginController {
  final authController = AuthController();

  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      final user = UserModel(
        name: response!.displayName,
        email: response.email,
        photoURL: response.photoUrl,
      );
      authController.setUser(context, user);
    } catch (error) {
      authController.setUser(context, null);
      print(error);
    }
  }

  Future<void> firebaseAuthSignIn(
      BuildContext context, _email, _password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email!,
        password: _password!,
      );
      final user = UserModel(
          name: userCredential.user!.displayName,
          email: userCredential.user!.email,
          photoURL: userCredential.user!.photoURL);
      authController.setUser(context, user);
      print(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (error) {
      authController.setUser(context, null);
      print(error);
    }
  }

  Future<void> googleSignOut(BuildContext context) async {
    GoogleSignIn google = GoogleSignIn();
    await FirebaseAuth.instance.signOut();
    await google.signOut();
    UserModel? user = UserModel();
    authController.setUser(context, user);
  }
}
