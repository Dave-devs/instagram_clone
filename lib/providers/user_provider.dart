import 'package:flutter/material.dart';
import 'package:instagram_clone/firebase_services/firebase_auth.dart';
import 'package:instagram_clone/model/user_model.dart';

class UserProvider with ChangeNotifier{
  User? _user;
  final FirebaseServiceAuth _firebaseServiceAuth = FirebaseServiceAuth();

  User get getUser {
    return _user!;
  }

  Future<void> refreshUser() async {
    User user = await _firebaseServiceAuth.getUserDetails();

    _user = user;
    notifyListeners();
  }
}



// class UserNotifier extends StateNotifier<User>{
//   User? _user;
//   final FirebaseServiceAuth _firebaseServiceAuth = FirebaseServiceAuth();

//   UserNotifier(super.state);

//   User get getUser {
//     return _user!;
//   }

//   Future<void> refreshUser() async {
//     User user = await _firebaseServiceAuth.getUserDetails();

//     _user = user;
//   }
// }

// final user1Provider = StateNotifierProvider<UserNotifier, User>((ref) => UserNotifier(
//   const User(
//     email: '',
//     username: '',
//     bio: '',
//     uid: '',
//     photoUrl: '',
//     followers: [],
//     following: []
//   ))
// );
