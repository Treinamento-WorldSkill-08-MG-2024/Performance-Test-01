import 'package:apis_01/modules/fred_api.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCt = TextEditingController();
  final _passCt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailCt,
              ),
              SizedBox(height: 50,),
              TextFormField(
                controller: _passCt,
              ),
              OutlinedButton(
                onPressed: () async {
                  _formKey.currentState!.save();

                  var api = UsersApi();
                  var test = await api.login(_emailCt.text, _passCt.text);
                  print("RESULT");
                  print(test);
                },
                child: Text("Enviar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
