import 'package:movie/app/app.locator.dart';
import 'package:movie/models/tmdb/tmdb_movie_basic.dart';
import 'package:movie/services/api_service.dart';
import 'package:stacked/stacked.dart';

final _apiService = locator<ApiService>();

class HomeViewModel extends BaseViewModel {
  List<TMDBMovieBasic> movies = [];

  Future popularMovies() async {
    var res = await _apiService.popularMovies();
    movies = res.results;
    notifyListeners();
  }

  runStartupLogic() async {
    await popularMovies();
  }
}
