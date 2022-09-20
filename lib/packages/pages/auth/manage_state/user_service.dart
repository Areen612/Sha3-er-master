import 'dart:io';
import 'package:shagher/language/generated/key_lang.dart';

import '../model/user_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class UserAuthService extends ChangeNotifier {
  bool isLoading = false;
  String errorMessage = '';

  set setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  set setMessage(String value) {
    errorMessage = value;
    notifyListeners();
  }

  // * Firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // * Register
  Future<User?> register({required ModelUserAuth data}) async {
    try {
      setLoading = true;
      UserCredential _authResult =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: data.email!, password: data.password!);
      late User _user;
      if (_authResult.user?.uid.isNotEmpty ?? false) {
        _user = _authResult.user!;
        setLoading = false;
      }
      return _user;
    } on SocketException {
      setLoading = false;
      setMessage = KeyLang.noInternet.tr();
    } on FirebaseAuthException catch (error) {
      setLoading = false;
      setMessage = error.message ?? '';
    } catch (error) {
      setLoading = false;
      setMessage = error.toString();
    }
    return null;
  }

  // * Login
  Future<User?> login({
    required ModelUserAuth data,
  }) async {
    try {
      setLoading = true;
      UserCredential _authResult =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: data.email!,
        password: data.password!,
      );

      late User _user;
      if (_authResult.user?.uid.isNotEmpty ?? false) {
        _user = _authResult.user!;
        setLoading = false;
      }
      return _user;
    } on SocketException {
      setLoading = false;
      setMessage = KeyLang.noInternet.tr();
    } on FirebaseAuthException catch (error) {
      setLoading = false;
      setMessage = error.message ?? '';
    } catch (e) {
      setLoading = false;
      setMessage = e.toString();
    }
    return null;
  }

  // * reset Password
  Future<bool> resetPassword({required ModelUserAuth data}) async {
    try {
      setLoading = false;
      await _firebaseAuth.sendPasswordResetEmail(email: data.email!);
      setLoading = false;
      return true;
    } on SocketException {
      setLoading = false;
      setMessage = KeyLang.noInternet.tr();
      return false;
    } on FirebaseAuthException catch (error) {
      setLoading = false;
      setMessage = error.message ?? '';
      return false;
    } catch (e) {
      setLoading = false;
      setMessage = e.toString();
      return false;
    }
  }

  // * signOut
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // * get Data User
  User get userData => _firebaseAuth.currentUser!;

  // * get User State
  Stream<User> get userStream =>
      _firebaseAuth.authStateChanges().map((User? user) => user!);
}
