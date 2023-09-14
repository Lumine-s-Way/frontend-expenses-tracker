import '../decorators/test_decorator.dart';

@IsTest()
enum LoginState {
  loginIn,
  loginOut
}