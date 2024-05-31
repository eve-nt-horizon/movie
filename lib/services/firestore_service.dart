import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie/ui/smol_widgets/movie_list.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');

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
