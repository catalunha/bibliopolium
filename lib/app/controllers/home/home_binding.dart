import 'package:bibliopolium/app/controllers/user/user_repository.dart';
import 'package:bibliopolium/app/controllers/user/user_repository_impl.dart';
import 'package:bibliopolium/app/models/user/user_source.dart';
import 'package:bibliopolium/app/models/user/user_source_impl.dart';
import 'package:get/get.dart';
import 'package:bibliopolium/app/controllers/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<UserSource>(
      UserSourceImpl(
        firebaseFirestore: Get.find(),
      ),
    );
    Get.put<UserRepository>(
      UserRepositoryImpl(
        userSource: Get.find(),
      ),
    );
    Get.put<HomeController>(HomeController(
      authController: Get.find(),
      userController: Get.find(),
    ));
  }
}
