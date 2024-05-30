import 'package:flutter/material.dart';
import 'package:movie/app/app.locator.dart';
import 'package:movie/app/app.router.dart';
import 'package:movie/ui/views/sign_up/sign_up_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'login_viewmodel.dart';

final _navigationService = locator<NavigationService>();

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: viewModel.emailController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: viewModel.passwordController,
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              heroTag: 'login',
              onPressed: () {
                viewModel.login();
                _navigationService.navigateToDetectloginView();
              },
              child: const Text('Login'),
            ),
            FloatingActionButton(
              heroTag: 'gosignup',
              onPressed: () {
                viewModel.navigateToSignUpView();
              },
              child: const Text('Register'),
            )
          ],
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
