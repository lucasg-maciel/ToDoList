import 'dart:io';
import 'package:to_do_list/Usuario.dart';

abstract class AuthService {
  Usuario? get user;

  Stream<Usuario?> get userChanges;

  Future<void> signup(
    String name,
    String email,
    String password,
  );

  Future<void> login(
    String name,
    String password,
  );

  Future<void> logout();


}
