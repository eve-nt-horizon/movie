import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie/app/app.locator.dart';
import 'package:movie/app/app.router.dart';
import 'package:movie/services/firebase_auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

final _navigationService = locator<NavigationService>();
final _firebaseAuthService = locator<FirebaseAuthService>();

class LoginViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  void login() {
    _firebaseAuthService.loginWithEmail(
        email: emailController.text, password: passwordController.text);
  }

  void navigateToSignUpView() {
    _navigationService.replaceWithSignUpView();
  }
}
