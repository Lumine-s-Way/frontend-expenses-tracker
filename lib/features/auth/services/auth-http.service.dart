import 'dart:convert';
import 'package:frontend_expenses_tracker/configs/http/http_response.dart';
import 'package:http/http.dart' as http;

import 'package:frontend_expenses_tracker/configs/consts/config.dart';
import 'package:frontend_expenses_tracker/features/auth/models/user.model.dart';


class AuthHttpService {

  final url = "$uri/users";

  Future<User> findOne(String id) async {
    final response = await http
        .get(Uri.parse("$url/$id"));

    if (response.statusCode == 200) {

      Response convertResponse = Response.fromJson(jsonDecode(response.body));
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return User.fromJson(convertResponse.data);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load User');
    }
  }


  Future<List<User>> findAll() async {
    final List<User> users = [];
    final response = await http
        .get(Uri.parse(url));

    if (response.statusCode == 200) {

      Response<List<dynamic>> convertResponse = Response.fromJson(jsonDecode(response.body));

      for(Map<String, dynamic> res in convertResponse.data){
        User convertUser =User.fromJson(res);
        users.add(convertUser);
      }

      return users;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load User');
    }
  }



  void create() {
    throw Exception('not implemented');
  }

  void update() {
    throw Exception('not implemented');
  }

  void delete() {
    throw Exception('not implemented');
  }





  }



