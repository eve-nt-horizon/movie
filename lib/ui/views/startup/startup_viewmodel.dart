import 'package:movie/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:movie/app/app.locator.dart';
import 'package:movie/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _apiService = locator<ApiService>();

  // Place anything here that needs to happen before we get into the application

  Future authenticate() async {
    if (await _apiService.authenticate()) {
      print('Connected to api service');
    } else {
      throw Exception(' Could not connect to api service');
    }
  }

  Future storeGenresToMap() async {
    await _apiService.storeMovieGenreList();
  }

  Future runStartupLogic() async {
    await authenticate();
    await storeGenresToMap();

    _navigationService.replaceWithDetectloginView();
  }
}
