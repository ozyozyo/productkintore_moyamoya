import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:productkintore/entity/moyamoya.dart';

final firestireDataSourceProvider =
    Provider<FirestoreDataSource>((ref) => FirestoreDataSourceImpl());

final firebaseUserProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

abstract class FirestoreDataSource {
  Future<bool> createMoyamoya(
      {required String userId,
      required String nickname,
      required String title,
      required String moyamoya});
  Future<bool> commentMoyamoya(
      {required String ts, required String userId, required String comment});
  Future<List<Moyamoya>> fetchAllMoyamoya({DateTime? since});
  Future<Moyamoya?> fetchMoyamoya({required String ts});
}

class FirestoreDataSourceImpl implements FirestoreDataSource {
  late final FirebaseFirestore instance;

  FirestoreDataSourceImpl() {
    instance = FirebaseFirestore.instance;
  }

  @override
  Future<bool> createMoyamoya(
      {required String userId,
      required String nickname,
      required String title,
      required String moyamoya}) async {
    try {
      var collection = instance.collection("moyamoya");
      var moyamoyaId = collection.doc().id;
      collection.doc(moyamoyaId).set({
        "moyamoyaId": moyamoyaId,
        "moyamoyaUser": userId,
        "title": title,
        "moyamoya": moyamoya,
        "createdAt": DateTime.now()
      });
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  @override
  Future<bool> commentMoyamoya(
      {required String ts,
      required String userId,
      required String comment}) async {
    try {
      var doc = instance.collection("moyamoya").doc(ts);
      Map<String, String> obj = {
        "commented": userId,
        "comment": comment,
        "createdAt": DateTime.now().toString(),
      };
      await doc.update({
        "comments": FieldValue.arrayUnion([obj])
      });
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  @override
  Future<List<Moyamoya>> fetchAllMoyamoya({DateTime? since}) async {
    var query =
        instance.collection("moyamoya").orderBy("createdAt", descending: true);
    /*
    if (since != null) {
      query.where("createdAt", isLessThan: since);
    }
    */

    var snapshot = await query.get();

    return snapshot.docs
        .map((event) => Moyamoya.fromJson(event.data()))
        .toList();
  }

  @override
  Future<Moyamoya?> fetchMoyamoya({required String ts}) async {
    var docRef = instance.collection("moyamoya").doc(ts);
    var docSnapShot = await docRef.get();
    var data = docSnapShot.data();

    if (data == null) {
      return null;
    }
    return Moyamoya.fromJson(data);
  }
}
