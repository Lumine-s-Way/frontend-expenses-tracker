import 'package:flutter/material.dart';
import 'package:frontend_expenses_tracker/shared/decorators/test_decorator.dart';

final class User {
  final String? id;
  final String username;
  final String password;

  const User({this.id, required this.username, required this.password});

  User.withAssert(
      {required this.id, required this.username, required this.password})
      : assert(username.isEmpty && password.isEmpty);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> user = {"username": username, "password": password};

    if (id != null) user["id"] = id;

    return user;
  }

  static List<User> toArray(List<dynamic> data) {
    List<User> users = [];

    for (Map<String, dynamic> res in data) {
      User convert = User.fromJson(res);
      users.add(convert);
    }

    return users;
  }
}
