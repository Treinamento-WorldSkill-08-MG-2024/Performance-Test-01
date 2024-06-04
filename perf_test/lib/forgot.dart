import 'package:flutter/material.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isSecondFieldValid = false;
  bool isFirstFieldValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Insira seu email",
                      ),
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          setState(() {
                            isFirstFieldValid = true;
                          });

                          return "";
                        }

                        return null;
                      },
                      onChanged: (_) {
                        if (_formKey.currentState!.validate()) {
                          isFirstFieldValid = true;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Pergunta",
                      ),
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          setState(() {
                            isSecondFieldValid = true;
                          });

                          return "";
                        }

                        return null;
                      },
                      onChanged: (_) {
                        if (_formKey.currentState!.validate()) {
                          isSecondFieldValid = true;
                        }
                      },
                    ),
                  ),
                  OutlinedButton(
                      onPressed: isFirstFieldValid && isSecondFieldValid
                          ? () {}
                          : null,
                      child: const Text("validar")),
                ],
              ))
        ],
      )),
    );
  }
}
