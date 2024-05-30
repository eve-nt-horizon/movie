import 'package:movie/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:movie/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:movie/ui/views/home/home_view.dart';
import 'package:movie/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:movie/ui/views/results/results_view.dart';
import 'package:movie/ui/views/search/search_view.dart';
import 'package:movie/ui/views/login/login_view.dart';
import 'package:movie/ui/views/sign_up/sign_up_view.dart';

import 'package:movie/ui/views/movie_page/movie_page_view.dart';

import 'package:movie/ui/views/detectlogin/detectlogin_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: ResultsView),
    MaterialRoute(page: SearchView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: MoviePageView),
    MaterialRoute(page: LoginView),

    MaterialRoute(page: DetectloginView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
