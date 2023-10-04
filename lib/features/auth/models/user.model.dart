import 'package:frontend_expenses_tracker/shared/decorators/test_decorator.dart';

final class User {
  // @IsTest()
  final String id;
  final String username;
  final String password;

  const User(
      {required this.id, required this.username, required this.password});

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
    return <String, dynamic>{
      "id": id,
      "username": username,
      "password": password
    };
    ;
  }
}
