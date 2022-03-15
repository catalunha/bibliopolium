import 'package:bibliopolium/app/controllers/community/community_repository.dart';
import 'package:bibliopolium/app/controllers/user/user_repository.dart';
import 'package:bibliopolium/app/models/community/community_source.dart';
import 'package:bibliopolium/app/models/model/comunity_model.dart';
import 'package:bibliopolium/app/models/model/user_model.dart';
import 'package:bibliopolium/app/models/user/user_source.dart';

class CommunityRepositoryImpl implements CommunityRepository {
  final CommunitySource _communitySource;
  CommunityRepositoryImpl({required CommunitySource communitySource})
      : _communitySource = communitySource;

  @override
  Future<List<CommunityRef>?> getAll() => _communitySource.getAll();

  @override
  Future<CommunityRef?> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }
}
