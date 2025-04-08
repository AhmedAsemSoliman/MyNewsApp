import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String username;
  final String email;
  final String bio;
  final String image;
  final String userId;
  List followers;
  List followings;
  //final String password;
  UserModel(
      {required this.image,
      required this.bio,
      required this.userId,
      required this.username,
      required this.email,
      required this.followers,
      required this.followings});

  // constructor fromSnapShot to get data from firebase
  // documentSnapshot is place the store data in cloudfirestore
  factory UserModel.fromSnapShot(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return UserModel(
        username: snapshot['usename'],
        email: snapshot['email'],
        image: snapshot['image'],
        followers: snapshot['followers'],
        followings: snapshot['followeings'],
        bio: snapshot['bio'],
        userId: snapshot['userId']);
  }
  // method toSnapShot to send data to cloudfirestore
  Map<String, dynamic> toSnapShot() {
    return {
      'userId': userId,
      'username': username,
      'email': email,
      'image': image,
      'bio': bio,
      'followers': followers,
      'followings': followings
    };
  }
}
