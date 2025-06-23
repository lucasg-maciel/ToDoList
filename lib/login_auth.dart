import 'dart:io';
import 'package:to_do_list/Usuario.dart';
import 'package:to_do_list/auth_firebase.dart';

abstract class LoginAuth {
  Usuario? get user;

  Stream<Usuario?> get userChanges;

  Future<void> signup(
    String name,
    String email,
    String password,
  );

  Future<void> login(
    String email,
    String password,
  );

  Future<void> logout();
  
  factory LoginAuth() {
    return AuthFirebase();
  }
}
