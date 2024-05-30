import 'package:flutter/material.dart';
import 'package:movie/app/app.locator.dart';
import 'package:movie/ui/views/home/home_view.dart';
import 'package:movie/ui/views/login/login_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'detectlogin_viewmodel.dart';

final _navigationService = locator<NavigationService>();

class DetectloginView extends StackedView<DetectloginViewModel> {
  const DetectloginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DetectloginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: StreamBuilder(
          stream: viewModel.stream,
          builder: (context, snapshot) {
            if (snapshot.data?.uid == null) {
              return LoginView();
            }
            return HomeView();
          },
        ));
  }

  @override
  DetectloginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DetectloginViewModel();
}
