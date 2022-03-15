import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bibliopolium/app/controllers/auth/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  final RegisterController _registerController = Get.find();

  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailTec = TextEditingController();
  final _passwordTec = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
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
        title: Text(
          'Cadastro',
        ),
      ),
      body: Column(
        children: [
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
              ],
            ),
          ),
          TextButton(
            child: const Text('Registrar-me'),
            onPressed: () {
              // final formValid = _formKey.currentState?.validate() ?? false;
              if (_formKey.currentState!.validate()) {
                widget._registerController.registerUser(
                  email: _emailTec.text,
                  password: _passwordTec.text,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
