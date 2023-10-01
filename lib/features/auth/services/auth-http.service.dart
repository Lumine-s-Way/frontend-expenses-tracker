import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:frontend_expenses_tracker/configs/consts/backend.dart';
import 'package:frontend_expenses_tracker/features/auth/models/user.model.dart';


class AuthHttpService {

  final url = "$uri/users/";

  Future<User> findOne(String id) async {
    final response = await http
        .get(Uri.parse("$url/$id"));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return User.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  }

  void create() {
    throw 'not implemented';
  }

  void update() {
    throw 'not implemented';
  }

  void delete() {
    throw 'not implemented';
  }

