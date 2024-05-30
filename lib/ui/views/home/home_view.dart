import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:movie/app/app.locator.dart';
import 'package:movie/app/app.router.dart';
import 'package:movie/services/api_service.dart';
import 'package:movie/services/firebase_auth_service.dart';
import 'package:movie/ui/smol_widgets/movie_list.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'home_viewmodel.dart';

final _navigationService = locator<NavigationService>();
final _apiService = locator<ApiService>();
final _firebaseAuthService = locator<FirebaseAuthService>();

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);
  final int id = 69;
  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie database'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FloatingActionButton.large(
              onPressed: () => _navigationService.replaceWithSearchView(),
              child: const Text('Search'),
            ),
            FloatingActionButton.small(
              onPressed: () {
                _firebaseAuthService.logOut();
              },
              child: Text('Sign Out'),
            ),
            MovieList(movies: viewModel.movies),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
