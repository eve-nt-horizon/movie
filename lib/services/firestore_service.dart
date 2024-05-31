import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');

  final StreamController<List<int>> _watchlistController =
      StreamController<List<int>>.broadcast();

  Stream listenToWatchlistChanges() {
    _usersCollectionReference.snapshots().listen((userSnapshot) {
      if (userSnapshot.docs.isNotEmpty) {
        var movieIds = userSnapshot.docs.first as List<int>;
        _watchlistController.add(movieIds);
      }
    });
    return _watchlistController.stream;
  }

  Future addPost({required userEmail, movieId}) async {
    try {
      var doc = await _usersCollectionReference.doc(userEmail).get();
      if (doc.exists) {
        await _usersCollectionReference.doc(userEmail).update({
          'movieId': FieldValue.arrayUnion([movieId])
        });
      } else {
        await _usersCollectionReference.doc(userEmail).set({
          'movieId': [movieId].toList()
        });
      }
      print('Saved');
    } catch (e) {
      print(e);
    }
  }

  Future removePost({required userEmail, required movieId}) async {
    try {
      await _usersCollectionReference.doc(userEmail).update({
        'movieId': FieldValue.arrayRemove([movieId])
      });

      print('Saved');
    } catch (e) {
      print(e);
    }
  }
}
