import 'package:flutter/material.dart';
import 'package:movie/app/app.locator.dart';
import 'package:movie/services/firebase_auth_service.dart';
import 'package:stacked/stacked.dart';

final _firebaseAuthService = locator<FirebaseAuthService>();

class SignUpViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signUp() async {
    var res = _firebaseAuthService.signUpWithEmail(
        email: emailController.text, password: passwordController.text);
    print('Sign up result $res');
  }
}
