import 'package:bibliopolium/app/controllers/user/user_controller.dart';
import 'package:bibliopolium/app/controllers/user/user_repository.dart';
import 'package:bibliopolium/app/models/exceptions/user_exceptions.dart';
import 'package:bibliopolium/app/models/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:bibliopolium/app/controllers/auth/auth_controller.dart';
import 'package:bibliopolium/app/controllers/mixins/loader_mixin.dart';
import 'package:bibliopolium/app/controllers/mixins/message_mixin.dart';

class HomeController extends GetxController with LoaderMixin, MessageMixin {
  final AuthController _authController;
  final UserController _userController;
  HomeController({
    required AuthController authController,
    required UserController userController,
  })  : _authController = authController,
        _userController = userController;
  User? get userAuth => _authController.user;
  UserModel? get userModel => _userController.userModel;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  // Future<void> hasUserModel() async {
  //   try {
  //     print('HomeController');
  //     print('userUid: ${user.uid}');
  //     var userModel = await _userRepository.getByuid(user.uid);
  //     print(userModel?.toString() ?? "Usuario nao encontrado");
  //   } on UserException catch (e) {
  //     print(e.message);
  //   } catch (e) {
  //     print('Erro geral em _userRepository.getByuid(${user.uid})');
  //     print(e);
  //   }
  // }

  void logout() async {
    _authController.logout();
  }
}
