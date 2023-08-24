import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String name;
  final String email;
  final String username;
  final String bio;
  final String uid;
  final String profilePic;
  final List followers;
  final List following;
  final List post;

  const User({
    required this.name,
    required this.email,
    required this.username,
    required this.bio,
    required this.uid,
    required this.profilePic,
    required this.followers,
    required this.following,
    required this.post,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'username': username,
      'bio': bio,
      'uid': uid,
      'photoUrl': profilePic,
      'followers': followers,
      'following': following,
      'post': post,
    };
  }

  static User fromSnap(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;

    return User(
      name: snap['name'],
      email: snap['email'],
      username: snap['username'],
      bio: snap['bio'],
      uid: snap['uid'],
      profilePic: snap['photoUrl'],
      followers: snap['followers'],
      following: snap['following'],
      post: snap['post'],
    );
  }
}
