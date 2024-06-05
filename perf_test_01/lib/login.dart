import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.always,
                obscureText: true,
              ),
              TextFormField(
                decoration: const InputDecoration(),
              ),
              OutlinedButton(onPressed: () {}, child: const Text("Entrar"))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
