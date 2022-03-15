import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:bibliopolium/app/controllers/auth/auth_repository.dart';
import 'package:bibliopolium/app/routes.dart';

class AuthController extends GetxController {
  Rx<User?> _userFirebaseAuth = Rx<User?>(FirebaseAuth.instance.currentUser);
  User? get user => _userFirebaseAuth.value;

  final FirebaseAuth _firebaseAuth;
  final AuthRepository _authRepository;

  AuthController({
    required FirebaseAuth firebaseAuth,
    required AuthRepository authRepository,
  })  : _firebaseAuth = firebaseAuth,
        _authRepository = authRepository;

  @override
  onInit() {
    _userFirebaseAuth.bindStream(_firebaseAuth.authStateChanges());
    _userFirebaseAuth.bindStream(_firebaseAuth.userChanges());
    ever<User?>(_userFirebaseAuth, (user) async {
      if (user != null) {
        print('user');
        Get.offAllNamed(Routes.user);
      } else {
        print('login');
        Get.offAllNamed(Routes.authLogin);
      }
    });
    super.onInit();
  }

  Future<void> logout() => _authRepository.logout();
}
