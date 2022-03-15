import 'package:bibliopolium/app/controllers/user/user_repository.dart';
import 'package:bibliopolium/app/controllers/user/user_repository_impl.dart';
import 'package:bibliopolium/app/models/auth/auth_source.dart';
import 'package:bibliopolium/app/models/auth/auth_source_impl.dart';
import 'package:bibliopolium/app/models/user/user_source.dart';
import 'package:bibliopolium/app/models/user/user_source_impl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:bibliopolium/app/controllers/auth/auth_controller.dart';
import 'package:bibliopolium/app/controllers/auth/auth_repository.dart';
import 'package:bibliopolium/app/controllers/auth/auth_repository_impl.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<FirebaseAuth>(
      FirebaseAuth.instance,
      permanent: true,
    );
    Get.put<FirebaseFirestore>(
      FirebaseFirestore.instance,
      permanent: true,
    );
    Get.put<AuthSource>(
      AuthSourceImpl(
        firebaseAuth: Get.find(),
      ),
      permanent: true,
    );
    Get.put<AuthRepository>(
      AuthRepositoryImpl(
        authSource: Get.find(),
      ),
      permanent: true,
    );

    Get.put<AuthController>(
      AuthController(
        firebaseAuth: Get.find(),
        authRepository: Get.find(),
      ),
      permanent: true,
    );
  }
}
