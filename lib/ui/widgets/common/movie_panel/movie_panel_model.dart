import 'package:flutter/material.dart';
import 'package:movie/app/app.locator.dart';
import 'package:movie/app/app.router.dart';
import 'package:movie/services/api_service.dart';
import 'package:movie/ui/views/movie_page/movie_page_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

final _apiService = locator<ApiService>();
final _navigationService = locator<NavigationService>();

class MoviePanelModel extends BaseViewModel {
  Future navigateToMoviePage({required id}) async {
    var movie = await _apiService.findMovieById(id);

    _navigationService.clearTillFirstAndShowView(MoviePageView(movie: movie));
  }
}
