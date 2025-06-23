import 'dart:io';
import 'dart:async';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:to_do_list/Usuario.dart';
import 'package:to_do_list/login_auth.dart';

class AuthFirebase implements LoginAuth {
  static Usuario? _user;

  static final _userStream = Stream<Usuario?>.multi((controller) async {
    final authChanges = FirebaseAuth.instance.authStateChanges();
    await for (final user in authChanges) {
      _user = user == null ? null : _toUser(user);
      controller.add(_user);
    }
  });

  @override
  Usuario? get user {
    return _user;
  }

  @override
  Stream<Usuario?> get userChanges {
    return _userStream;
  }

  @override
  Future<void> signup(
      String name, String email, String password) async {
    final auth = FirebaseAuth.instance;
    UserCredential credential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (credential.user == null) return;


    await credential.user?.updateDisplayName(name);

    _user = _toUser(credential.user!, name);
  }



  static Usuario _toUser(User user, [String? name]) {
    return Usuario(
      id: user.uid,
      name: name ?? user.displayName ?? user.email!,
      email: user.email!,
    );
  }
  

}
