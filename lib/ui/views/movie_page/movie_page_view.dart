import 'package:flutter/material.dart';
import 'package:movie/app/app.locator.dart';
import 'package:movie/app/app.router.dart';
import 'package:movie/models/tmdb/tmdb_movie_basic.dart';
import 'package:movie/services/firebase_auth_service.dart';
import 'package:movie/services/firestore_service.dart';
import 'package:movie/ui/views/search/search_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'movie_page_viewmodel.dart';

final _firestoreService = locator<FirestoreService>();
final _firebaseAuthService = locator<FirebaseAuthService>();

class MoviePageView extends StackedView<MoviePageViewModel> {
  const MoviePageView({Key? key, required this.movie}) : super(key: key);
  final TMDBMovieBasic movie;

  @override
  Widget builder(
    BuildContext context,
    MoviePageViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              viewModel.movieImage(movie.posterPath),
              GestureDetector(
                onTap: () {
                  _firestoreService.removePost(
                      userEmail: _firebaseAuthService.user!.email,
                      movieId: movie.id);
                  // _firestoreService.addPost(
                  //     userEmail: _firebaseAuthService.user!.email,
                  //     movieId: movie.id);
                },
                child: const Row(
                  children: [
                    Text('Add to watchlist'),
                    Icon(Icons.star_border_outlined)
                  ],
                ),
              ),
              Text('Title: ${movie.title} Ratings:${movie.voteAverage}'),
              Text('Overview: ${movie.overview}'),
              viewModel.movieImage(movie.backdropPath),
            ],
          ),
        ),
      ),
    );
  }

  @override
  MoviePageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MoviePageViewModel();
}
