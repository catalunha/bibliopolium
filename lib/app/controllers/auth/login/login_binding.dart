import 'package:get/get.dart';
import 'package:bibliopolium/app/controllers/auth/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
        () => LoginController(authRepository: Get.find()));
  }
}
