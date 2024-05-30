import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseAuthService {
  FirebaseApp app;

  FirebaseAuthService({required this.app}) {
    _firebaseAuth = FirebaseAuth.instanceFor(app: app);
  }
  late FirebaseAuth _firebaseAuth;

  Stream<User?> get onAuthStateChanged => _firebaseAuth.authStateChanges();

  User? get user => _firebaseAuth.currentUser;

  void initApp() async {
    _firebaseAuth = FirebaseAuth.instanceFor(app: app);
  }

  Future loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      var user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return user;
    } catch (e) {
      return e;
    }
  }

  Future signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return authResult.user != null;
    } catch (e) {
      return e;
    }
  }

  Future logOut() async {
    await _firebaseAuth.signOut();
  }
}
