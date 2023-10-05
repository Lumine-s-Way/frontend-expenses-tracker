import 'dart:convert';
import 'package:frontend_expenses_tracker/configs/http/http_response.dart';
import 'package:http/http.dart' as http;

import 'package:frontend_expenses_tracker/configs/consts/config.dart';
import 'package:frontend_expenses_tracker/features/auth/models/user.model.dart';

class AuthHttpService {
  final url = "$uri/users";

  Future<User> findOne(String id) async {
    final response = await http.get(Uri.parse("$url/$id"));

    if (response.statusCode >= 400) throw Exception('Failed to load User');

    Response convertResponse = Response.fromJson(jsonDecode(response.body));
    return User.fromJson(convertResponse.data);
  }

  Future<List<User>> findAll() async {
    final List<User> users = [];
    final response = await http.get(Uri.parse(url));

    if (response.statusCode >= 400) {
      throw Exception(jsonDecode(response.body)["message"]);
    }

    Response<List<dynamic>> convertResponse =
        Response.fromJson(jsonDecode(response.body));

    for (Map<String, dynamic> res in convertResponse.data) {
      User convertUser = User.fromJson(res);
      users.add(convertUser);
    }

    return users;
  }

  void create(User user) async {
    final response = await http.post(
      Uri.parse(url),
      headers: jsonHeaders,
      body: jsonEncode(user.toJson()),
    );
  }

  void update(String id, User user) async {
    final response = await http.put(
      Uri.parse("$url/$id"),
      headers: jsonHeaders,
      body: jsonEncode(user.toJson()),
    );
  }

  void delete(String id) async {
    final response = await http.delete(
      Uri.parse("$url/$id"),
    );
  }
}
