import 'package:frontend_expenses_tracker/shared/decorators/test_decorator.dart';

final class Login {
  @IsTest()
  final String username;
  final String password;

  Login.withAssert({required this.username, required this.password})
      : assert(username.isEmpty && password.isEmpty);

  String methodValidate() {
    return username;
  }
}
