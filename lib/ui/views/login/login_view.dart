import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

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
              onPressed: () {},
              child: const Text('Login'),
            ),
            FloatingActionButton(
              onPressed: () {},
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
