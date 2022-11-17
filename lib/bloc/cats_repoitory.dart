import 'dart:convert';
import 'dart:io';

import 'package:bloc_state/bloc/cats_model.dart';
import 'package:http/http.dart' as http;

abstract class CatsRepository {
  Future<List<CatsModel>> fetchCats();
}

class SampleCatsRepository implements CatsRepository {
  final baseUrl = "https://hwasampleapi.firebaseio.com/http.json";
  @override
  Future<List<CatsModel>> fetchCats() async {
    final response = await http.get(Uri.parse(baseUrl));
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body);
        return jsonBody.map<CatsModel>((e) => CatsModel.fromJson(e)).toList();
      default:
        throw NetWorkError(response.statusCode.toString(), response.body);
    }
  }
}

class NetWorkError implements Exception {
  final String statusCode;
  final String message;
  NetWorkError(this.statusCode, this.message);
}
