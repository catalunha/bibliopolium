import 'package:get/get.dart';
import 'package:bibliopolium/app/controllers/auth/auth_exception.dart';
import 'package:bibliopolium/app/controllers/mixins/loader_mixin.dart';
import 'package:bibliopolium/app/controllers/mixins/message_mixin.dart';
import 'package:bibliopolium/app/controllers/auth/auth_repository.dart';

class LoginController extends GetxController with LoaderMixin, MessageMixin {
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  final AuthRepository _authRepository;
  LoginController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  Future<void> loginGoogle() async {
    try {
      _loading(true);
      final user = await _authRepository.loginGoogle();
      if (user != null) {
        //success
      } else {
        _authRepository.logout();
        _message.value = MessageModel(
          title: 'Erro',
          message: 'Em escolher conta do Google',
          isError: true,
        );
      }
    } on AuthException catch (e) {
      _authRepository.logout();
      _message.value = MessageModel(
        title: 'AuthException',
        message: 'Em escolher conta do Google',
        isError: true,
      );
    } finally {
      _loading(false);
    }
  }

  Future<void> loginEmail(String email, String password) async {
    try {
      _loading(true);
      final user =
          await _authRepository.loginEmail(email: email, password: password);
      if (user != null) {
        //success
      } else {
        _message.value = MessageModel(
          title: 'Erro',
          message: 'Usuário ou senha inválidos.',
          isError: true,
        );
      }
    } on AuthException catch (e) {
      _loading(false);
      _message.value = MessageModel(
        title: 'Oops',
        message: e.message,
        isError: true,
      );
    } finally {
      _loading(false);
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      final user = await _authRepository.forgotPassword(email);
      _message.value = MessageModel(
        title: 'Erro',
        message: 'orientações sobre recuperação de senha ',
      );
    } on AuthException catch (e) {
      _authRepository.logout();
      _message.value = MessageModel(
        title: 'AuthException',
        message: 'Em recuperar senha',
        isError: true,
      );
    }
  }
}
