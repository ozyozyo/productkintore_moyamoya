import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:productkintore/database/firestore_data_source.dart';
import 'package:productkintore/entity/moyamoya.dart';
import 'package:productkintore/provider/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final fetchAllMoyamoyaProvider = FutureProvider.autoDispose<List<Moyamoya>>(
  (ref) async {
    var provider = ref.watch(moyamoyaProvider);
    var data = await provider.fetchAllMoyamoya();
    return data.when(success: (value) {
      return value;
    }, failure: (e) {
      return [];
    });
  },
);
final fetchMoyamoyaProvider =
    FutureProvider.autoDispose.family<Moyamoya, String>(
  (ref, ts) async {
    var provider = ref.watch(moyamoyaProvider);
    var data = await provider.fetchMoyamoya(ts: ts);
    return data.when(success: (value) {
      return value;
    }, failure: (e) {
      return [];
    });
  },
);

final moyamoyaProvider = Provider((ref) => MoyamoyaRepositoryImpl(
    firestoreDataSource: ref.watch(firestireDataSourceProvider)));

abstract class MoyamoyaRepository {
  Future<Result<void>> createMoyamoya(
      {required String nickname,
      required String title,
      required String moyamoya});
  Future<Result<void>> commentMoyamoya(
      {required String ts, required String comment});
  Future<Result<List<Moyamoya>>> fetchAllMoyamoya({DateTime? since});
  Future<Result<Moyamoya?>> fetchMoyamoya({required String ts});
}

class MoyamoyaRepositoryImpl implements MoyamoyaRepository {
  MoyamoyaRepositoryImpl({
    required FirestoreDataSource firestoreDataSource,
  }) : _firestoreDataSource = firestoreDataSource;

  final FirestoreDataSource _firestoreDataSource;

  @override
  Future<Result<void>> commentMoyamoya(
      {required String ts, required String comment}) {
    String userId = FirebaseAuth.instance.currentUser!.uid;

    return _firestoreDataSource
        .commentMoyamoya(userId: userId, comment: comment, ts: ts)
        .then((value) {
      if (value) return Result.success("");
      return Result.failure("");
    });
  }

  @override
  Future<Result<void>> createMoyamoya(
      {required String nickname,
      required String title,
      required String moyamoya}) {
    String userId = FirebaseAuth.instance.currentUser!.uid;

    return _firestoreDataSource
        .createMoyamoya(
            userId: userId,
            nickname: nickname,
            title: title,
            moyamoya: moyamoya)
        .then((value) {
      if (value) return Result.success("");
      return Result.failure("");
    });
  }

  @override
  Future<Result<List<Moyamoya>>> fetchAllMoyamoya({DateTime? since}) {
    return _firestoreDataSource.fetchAllMoyamoya(since: since).then((value) {
      return Result.success(value);
    }).catchError((error) => Result.failure(error));
  }

  @override
  Future<Result<Moyamoya?>> fetchMoyamoya({required String ts}) {
    return _firestoreDataSource.fetchMoyamoya(ts: ts).then((value) {
      return Result.success(value);
    }).catchError((error) => Result.failure(error));
  }
}
