import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class UserModel {
  final String name;
  final String email;
  final String password;
  final int points;
  final String question;
  final String answer;
  final String createdAt;
  final int isActive;
  final String image;

  UserModel(this.name, this.email, this.password, this.points, this.question,
      this.answer, this.createdAt, this.isActive, this.image);
}

class UserFields {
  static const name = 'users_nome';
  static const password = 'users_password';
  static const email = 'users_email';
  static const points = 'users_points';
  static const question = 'users_secure_question';
  static const answer = 'users_secure_answer';
  static const created = 'users_created_at';
  static const active = 'users_ativo';
  static const photo = 'users_photo';
}

const kBaseUrl = 'https://fredaugusto.com.br/centro40/olimpiada/simulado01';

class UsersApi {
  Future<List<UserModel>> getUsers() async {
    final response = await http.Client().get(Uri.parse('$kBaseUrl/users'));
    if (response.statusCode != HttpStatus.ok) {
      throw Exception("Response's not okay");
    }

    var users = List<UserModel>.empty(growable: true);
    final data = jsonDecode(response.body) as List<dynamic>;
    for (Map<String, dynamic> item in data) {
      users.add(
        UserModel(
            item[UserFields.name],
            item[UserFields.email],
            '',
            int.parse(item[UserFields.points]),
            item[UserFields.question],
            item[UserFields.answer],
            item[UserFields.created],
            int.parse(item[UserFields.active]),
            item[UserFields.photo]),
      );
    }

    return users;
  }

  Future<String> newUser() async {
    final reqBody = <String, String>{
      UserFields.name: 'dummy2',
      UserFields.email: 'dummy2@dummy.com',
      UserFields.password: '12',
      UserFields.points: '12',
      UserFields.question: 'oque é?',
      UserFields.answer: 'sim',
    };

    final request =
        http.MultipartRequest("POST", Uri.parse('$kBaseUrl/users/new'))
          ..fields.addAll(reqBody);
    final response = await request.send();
    if (response.statusCode != HttpStatus.ok) {
      throw Exception("Response not okay");
    }

    final jsonRes = await response.stream.bytesToString();
    final data = jsonDecode(jsonRes) as Map<String, dynamic>;

    return data['message'];
  }
}
