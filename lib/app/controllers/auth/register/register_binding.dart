import 'package:get/get.dart';
import 'package:bibliopolium/app/controllers/auth/register/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
        () => RegisterController(authRepository: Get.find()));
  }
}
