import 'package:flutter/material.dart';
import 'package:movie/app/app.locator.dart';
import 'package:movie/ui/views/login/login_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'sign_up_viewmodel.dart';

final _navigationService = locator<NavigationService>();

class SignUpView extends StackedView<SignUpViewModel> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignUpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView(
          children: [
            Text('Enter email'),
            TextField(
              controller: viewModel.emailController,
            ),
            Text('Enter password'),
            TextField(
              controller: viewModel.passwordController,
              obscureText: true,
            ),
            FloatingActionButton(
              onPressed: () {
                viewModel.signUp();
                _navigationService.clearStackAndShowView(LoginView());
              },
              child: const Text('Register'),
            )
          ],
        ));
  }

  @override
  SignUpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignUpViewModel();
}
