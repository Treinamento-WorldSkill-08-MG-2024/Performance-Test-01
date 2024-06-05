import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

enum RadioOptions {
  A,
  B,
  C,
  D,
}

class _QuizScreenState extends State<QuizScreen> {
  RadioOptions? _option = RadioOptions.A;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ListTile(
                title: const Text("A"),
                leading: Radio<RadioOptions>(
                  value: RadioOptions.A,
                  groupValue: _option,
                  onChanged: (value) {
                    setState(() {
                      _option = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text("B"),
                leading: Radio<RadioOptions>(
                  value: RadioOptions.B,
                  groupValue: _option,
                  onChanged: (value) {
                    setState(() {
                      _option = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text("C"),
                leading: Radio<RadioOptions>(
                  value: RadioOptions.C,
                  groupValue: _option,
                  onChanged: (value) {
                    setState(() {
                      _option = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text("D"),
                leading: Radio<RadioOptions>(
                  value: RadioOptions.D,
                  groupValue: _option,
                  onChanged: (value) {
                    setState(() {
                      _option = value;
                    });
                  },
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  print(_option.toString());
                },
                child: const Text("H"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
