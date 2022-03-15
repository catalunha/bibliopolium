import 'package:bibliopolium/app/models/model/comunity_model.dart';
import 'package:bibliopolium/app/models/model/user_model.dart';

abstract class CommunityRepository {
  Future<List<CommunityRef>?> getAll();
  Future<CommunityRef?> getById(String id);
}
