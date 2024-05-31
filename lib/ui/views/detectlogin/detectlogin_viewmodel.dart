import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie/app/app.locator.dart';
import 'package:movie/services/firebase_auth_service.dart';
import 'package:stacked/stacked.dart';

final _firebaseAuthService = locator<FirebaseAuthService>();

class DetectloginViewModel extends StreamViewModel {
  @override
  // TODO: implement stream
  Stream<User?> get stream => _firebaseAuthService.onAuthStateChanged;
}
