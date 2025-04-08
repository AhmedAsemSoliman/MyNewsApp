
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsly_app/models/user_model.dart';
import 'package:newsly_app/shared/errors/exceptions.dart';

class AuthenticationMethod {
  //create instance from FirebaseAuthentication
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  //method register
  signUpAuth(
      {required String username,
      required String email,
      required String password}) async {
    try {
      // condition to check fields has data ->  create new user
      // else fill rest of fields
      String response = 'some error';
      if (username.isNotEmpty || email.isNotEmpty || password.isNotEmpty) {
        UserCredential userCredential = await auth
            .createUserWithEmailAndPassword(email: email, password: password);
        UserModel userModel = UserModel(
            bio: '',
            userId: userCredential.user!.uid,
            username: username,
            email: email,
            followers: [],
            followings: [],
            image: '');
        FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential.user!.uid)
            .set(userModel.toSnapShot());
        response = 'success';
      } else {
        UserCredential userCredential = await auth
            .createUserWithEmailAndPassword(email: email, password: password);
        response = 'fill all fileds';
      }
      return response;
    } catch (error) {
      return error.toString();
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}",
      );
      if (e.code == 'user-not-found') {
        throw CustomException(
          message: 'الرقم السري او البريد الالكتروني غير صحيح.',
        );
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          message: 'الرقم السري او البريد الالكتروني غير صحيح.',
        );
      } else if (e.code == 'invalid-credential') {
        throw CustomException(
          message: 'الرقم السري او البريد الالكتروني غير صحيح.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تأكد من اتصالك بالانترنت.');
      } else {
        throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        );
      }
    } catch (e) {
      log(
        "Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}",
      );

      throw CustomException(
        message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
      );
    }
  }

  //
  // tFuture signInAuth({required String email, required String password}) async {
  //   String response = 'some error';
  //   try {
  //     if (email.isNotEmpty || password.isNotEmpty) {
  //       UserCredential userCredential = await auth
  //           .createUserWithEmailAndPassword(email: email, password: password);
  //       response = 'success';
  //     } else {
  //       print(response);
  //     }
  //   } on Exception catch (error) {
  //     print('Error : ${error.toString()}');
  //   }
  // }
}
