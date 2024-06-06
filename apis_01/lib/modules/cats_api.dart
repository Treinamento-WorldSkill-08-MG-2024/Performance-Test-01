import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class CatFactsModel {
  final String fact;
  final int length;

  CatFactsModel(this.fact, this.length);
}

class CatApi {
  final _baseURL = 'https://catfact.ninja';
  
  Future<CatFactsModel> getFact() async {
    var uri = Uri.parse('$_baseURL/fact');
    var response = await Client().get(uri);
    if (response.statusCode != HttpStatus.ok) {
      throw Exception("Response's not okay");
    }

    var data = json.decode(response.body) as Map<String, dynamic>;
    return CatFactsModel(data['fact'], data['length']);
  }
}