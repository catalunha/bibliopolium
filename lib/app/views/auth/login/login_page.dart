import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bibliopolium/app/controllers/auth/login/login_controller.dart';
import 'package:bibliopolium/app/routes.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  final LoginController _loginController = Get.find();

  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailTec = TextEditingController();
  final _passwordTec = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailTec.dispose();
    _passwordTec.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login testes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Este app apenas testa login neste fluxo'),
            const Text('1.1) Login email/senha - firebase Authentication'),
            const Text('1.2) Login Google - firebase Authentication'),
            const Text('2) Permissões acesso - firebase Firestore'),
            Divider(),
            TextButton(
              child: Text('Cadastrar conta com Email/Senha'),
              onPressed: () {
                Get.toNamed(Routes.authRegister);
              },
            ),
            Divider(),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text('Informe Email'),
                  TextFormField(
                    controller: _emailTec,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.email('Informe um email válido aqui.'),
                        Validatorless.required('Campo obrigatorio'),
                      ],
                    ),
                  ),
                  const Text('Informe Senha'),
                  TextFormField(
                    controller: _passwordTec,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.min(6, 'Informe mais de 6 caracteres'),
                        Validatorless.required('Campo obrigatorio'),
                      ],
                    ),
                  ),

                  // SizedBox(height: 10),
                ],
              ),
            ),
            TextButton(
              child: const Text('Login com Email/Senha'),
              onPressed: () {
                final formValid = _formKey.currentState?.validate() ?? false;
                if (formValid) {
                  widget._loginController
                      .loginEmail(_emailTec.text, _passwordTec.text);
                }
              },
            ),
            TextButton(
              child: Text('Esqueceu sua senha'),
              onPressed: () {
                if (_emailTec.text.isNotEmpty) {
                  widget._loginController.forgotPassword(_emailTec.text);
                } else {
                  Get.snackbar(
                    'Oops',
                    'Digite email para prosseguir',
                  );
                }
              },
            ),
            Divider(),
            TextButton(
              child: Text('Entre com o Google'),
              onPressed: () {
                widget._loginController.loginGoogle();
              },
            ),
          ],
        ),
      ),
    );
  }
}
