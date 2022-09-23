import 'dart:io';
import 'package:shagher/language/generated/key_lang.dart';
import 'package:shagher/packages/pages/auth/model/company_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CompanyAuthService extends ChangeNotifier {
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
  Future<User?> registerCompany({required ModelCompanyAuth data}) async {
    try {
      setLoading = true;
      UserCredential _authResult =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: data.email!, password: data.password!);
      late User _company;
      if (_authResult.user?.uid.isNotEmpty ?? false) {
        _company = _authResult.user!;
        setLoading = false;
      }
      return _company;
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
  Future<User?> loginCompany({
    required ModelCompanyAuth data,
  }) async {
    try {
      setLoading = true;
      UserCredential _authResult =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: data.email!,
        password: data.password!,
      );

      late User _company;
      if (_authResult.user?.uid.isNotEmpty ?? false) {
        _company = _authResult.user!;
        setLoading = false;
      }
      return _company;
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
  Future<bool> resetPassword({required ModelCompanyAuth data}) async {
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

  // * get Data Company
  User get companyData => _firebaseAuth.currentUser!;

  // * get Company State
  Stream<User> get companyStream =>
      _firebaseAuth.authStateChanges().map((User? company) => company!);
}
