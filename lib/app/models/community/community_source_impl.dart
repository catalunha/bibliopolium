import 'package:bibliopolium/app/models/community/community_source.dart';
import 'package:bibliopolium/app/models/exceptions/community_exceptions%20copy.dart';
import 'package:bibliopolium/app/models/exceptions/user_exceptions.dart';
import 'package:bibliopolium/app/models/model/comunity_model.dart';
import 'package:bibliopolium/app/models/model/user_model.dart';
import 'package:bibliopolium/app/models/user/user_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommunitySourceImpl implements CommunitySource {
  final FirebaseFirestore _firebaseFirestore;

  CommunitySourceImpl({required FirebaseFirestore firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore;

  @override
  Future<List<CommunityRef>?> getAll() async {
    try {
      var querySnapshot =
          await _firebaseFirestore.collection(CommunityModel.collection).get();
      List<CommunityRef> list = <CommunityRef>[];
      list = querySnapshot.docs
          .map(
            (queryDocumentSnapshot) => CommunityRef.fromMap(
              queryDocumentSnapshot.data(),
            ),
          )
          .toList();
      return list;
    } on CommunityException catch (e) {
      throw CommunityException(message: 'Erro em CommunitySourceImpl.getAll');
    }
  }

  @override
  Future<CommunityRef?> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }
}
