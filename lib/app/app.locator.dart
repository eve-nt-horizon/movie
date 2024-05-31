// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:firebase_core/firebase_core.dart';
import 'package:movie/services/api_service.dart';
import 'package:movie/services/firebase_auth_service.dart';
import 'package:movie/services/firestore_service.dart';
import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
  FirebaseApp app = await Firebase.initializeApp();
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);
// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => FirebaseAuthService(app: app));
  locator.registerLazySingleton(() => FirestoreService());
}
