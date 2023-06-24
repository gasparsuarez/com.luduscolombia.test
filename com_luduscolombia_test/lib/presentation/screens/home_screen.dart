import 'package:com_luduscolombia_test/domain/validator/validator.dart';
import 'package:com_luduscolombia_test/presentation/controllers/getx/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar Sesión')),
      body: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              width: size.width * 0.8,
              height: size.height * 0.35,
              decoration: BoxDecoration(
                  color: Colors.grey.shade400, borderRadius: BorderRadius.circular(25)),
              child: _LoginForm(),
            )
          ],
        ),
      ],
    );
  }
}

class _LoginForm extends StatelessWidget {
  _LoginForm();

  final FormController controller = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const Text('Ingrese los datos'),
              const SizedBox(height: 5),
              TextFormField(
                autocorrect: false,
                validator: (value) => Validator.isValidEmail(value!) ? null : 'Email inválido',
                decoration: const InputDecoration(filled: true, hintText: 'Email'),
                onChanged: controller.setEmail,
              ),
              const SizedBox(height: 20),
              TextFormField(
                autocorrect: false,
                validator: (value) => Validator.isValidPassword(value!)
                    ? null
                    : 'Mínimo de 8 caracteres ,numeros y símbolos.',
                decoration: const InputDecoration(filled: true, hintText: 'Password'),
                obscureText: true,
                onChanged: controller.setPassword,
              ),
              const Spacer(),
              FilledButton(
                  onPressed: () {
                    controller.submit(context);
                  },
                  child: const Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
