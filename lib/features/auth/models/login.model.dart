import 'package:frontend_expenses_tracker/shared/decorators/test_decorator.dart';

class Login {
  // @IsTest()
  final String id;
  final String username;
  final String password;

  const Login({required this.id, required this.username, required this.password});

  Login.withAssert({required this.id, required this.username, required this.password})
      : assert(username.isEmpty && password.isEmpty);

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      id: json['id'],
      username: json['username'],
      password: json['password'],
    );
  }


}
