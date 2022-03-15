import 'package:get/get.dart';
import 'package:bibliopolium/app/controllers/auth/auth_exception.dart';
import 'package:bibliopolium/app/controllers/mixins/loader_mixin.dart';
import 'package:bibliopolium/app/controllers/mixins/message_mixin.dart';
import 'package:bibliopolium/app/controllers/auth/auth_repository.dart';

class RegisterController extends GetxController with LoaderMixin, MessageMixin {
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  final AuthRepository _authRepository;
  RegisterController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _authRepository.register(
        email: email,
        password: password,
      );
      _loading(true);
      if (user != null) {
        //success
      } else {
        _authRepository.logout();
        _message.value = MessageModel(
          title: 'Erro',
          message: 'Em registrar usuário',
          isError: true,
        );
      }
    } on AuthException catch (e) {
      _authRepository.logout();
      _message.value = MessageModel(
        title: 'AuthException',
        message: 'Em registrar usuário',
        isError: true,
      );
    } finally {
      _loading(false);
    }
  }
}
