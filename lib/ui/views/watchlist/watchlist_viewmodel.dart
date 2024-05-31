import 'package:movie/app/app.locator.dart';
import 'package:movie/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

final _firestoreService=locator<FirestoreService>();
class WatchlistViewModel extends StreamViewModel {
  @override
  // TODO: implement stream
  Stream get stream => _firestoreService.listenToWatchlistChanges();

}
