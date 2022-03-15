import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bibliopolium/app/controllers/home/home_controller.dart';

class HomePage extends StatelessWidget {
  // final authController = Get.find<AuthController>();
  // final userController = Get.find<UserController>();

  final HomeController _homeController = Get.find();
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
        actions: [
          IconButton(
              onPressed: () => _homeController.logout(),
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Divider(color: Colors.red),
            const Text('AUTH:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Divider(),
            const Text('uid:', style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => Text(_homeController.userAuth?.uid ?? '...')),
            const Text('email:', style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => Text(_homeController.userAuth?.email ?? '...')),
            const Text('displayName:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => Text(_homeController.userAuth?.displayName ?? '...')),
            // const Text('phoneNumber:',
            //     style: TextStyle(fontWeight: FontWeight.bold)),
            // Obx(() => Text(_homeController.userAuth.phoneNumber ?? '...')),
            const Text('photoURL:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: _homeController.userAuth?.photoURL == null ||
                      _homeController.userAuth!.photoURL!.isEmpty
                  ? const Icon(Icons.person)
                  : Image.network(_homeController.userAuth?.photoURL ?? ''),
            ),
            const Divider(color: Colors.red),
            const Text('FIRESTORE:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Divider(),
            const Text('ID Firestore:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => Text(_homeController.userModel?.id ?? '')),
            const Text('uid Firestore:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => Text(_homeController.userModel?.uid ?? '')),
            const Text('email Firestore:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => Text(_homeController.userModel?.email ?? '...')),
            const Text('displayName Firestore:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => Text(_homeController.userModel?.displayName ?? "...")),
            const Text('cellPhone Firestore:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => Text(_homeController.userModel?.cellPhone ?? "...")),
            const Text('address Firestore:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => Text(_homeController.userModel?.address ?? "...")),
            const Text('cep Firestore:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => Text(_homeController.userModel?.cep ?? "...")),
            const Text('createdAt Firestore:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => Text(
                _homeController.userModel?.createdAt.toIso8601String() ??
                    "...")),
            const Text('isActive Firestore:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => Text(_homeController.userModel?.isActive ?? false
                ? 'true'
                : 'false')),
            Text('communityId Firestore:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => Text(
                _homeController.userModel?.communityRefList.toString() ?? '')),
            Text('level Firestore:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => Text(_homeController.userModel?.level.toString() ?? '')),
            const Text('photoUrl Firestore:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: _homeController.userModel?.photoUrl == null ||
                      _homeController.userModel!.photoUrl!.isEmpty
                  ? const Icon(Icons.person)
                  : Image.network(_homeController.userModel?.photoUrl ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}
