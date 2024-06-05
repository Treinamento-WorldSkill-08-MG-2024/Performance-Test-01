import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:perf_test_01/nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class Quiz {
  final String name;
  final String question;
  final String answer;

  Quiz(this.name, this.question, this.answer);
}

class _HomeScreenState extends State<HomeScreen> {
  final quizes = [Quiz('Quiz 01', 'what is aaaa?', 'bbbbb')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: quizes.length,
                shrinkWrap: true,
                itemBuilder: (c, i) => Column(
                  children: [
                    Text(quizes[i].name),
                    Text(quizes[i].question),
                    Text(quizes[i].answer),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _newQuiz,
        child: const Icon(Icons.plus_one),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }

  void _newQuiz() {
    showDialog(
      context: context,
      builder: (_) {
        final formKey = GlobalKey<FormState>();
        final nameFieldController = TextEditingController();
        final questionFieldController = TextEditingController();
        return AlertDialog(
          title: const Text("QUIZ"),
          content: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameFieldController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Failed";
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      controller: questionFieldController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Failed";
                        }

                        return null;
                      },
                    ),
                    OutlinedButton(
                      onPressed: () {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }

                        formKey.currentState!.save();

                        setState(() {
                          quizes.add(Quiz(nameFieldController.text,
                              questionFieldController.text, 'answer'));
                          formKey.currentState!.dispose();
                        });

                        Navigator.of(context).pop();
                      },
                      child: const Text("Confirmar"),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
