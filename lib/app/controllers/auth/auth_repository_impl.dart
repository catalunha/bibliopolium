import 'dart:async';

import 'package:bibliopolium/app/models/auth/auth_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bibliopolium/app/controllers/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthSource _authSource;
  AuthRepositoryImpl({
    required AuthSource authSource,
  }) : _authSource = authSource;
  @override
  Future<User?> register({required String email, required String password}) =>
      _authSource.register(email: email, password: password);

  @override
  Future<User?> loginEmail({required String email, required String password}) =>
      _authSource.loginEmail(email: email, password: password);

  @override
  Future<void> forgotPassword(String email) =>
      _authSource.forgotPassword(email);

  @override
  Future<User?> loginGoogle() => _authSource.loginGoogle();

  @override
  Future<void> logout() => _authSource.logout();

  @override
  Future<void> updateDisplayName(String name) =>
      _authSource.updateDisplayName(name);

  @override
  Future<void> updatePhotoURL(String photoUrl) =>
      _authSource.updatePhotoURL(photoUrl);
}
