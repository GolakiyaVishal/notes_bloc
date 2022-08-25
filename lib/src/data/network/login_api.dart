import 'package:flutter/foundation.dart' show immutable;
import 'package:notes_bloc/src/data/models/login_handle.dart';

/// [LoginApiProtocol]
/// abstract login method
@immutable
abstract class LoginApiProtocol {
  const LoginApiProtocol();

  /// Login must have two parameter
  /// [email], [password]
  Future<LoginHandle?> login({
    required String email,
    required String password,
  });
}

/// [LoginApi]
/// [LoginApiProtocol] implementation
@immutable
class LoginApi implements LoginApiProtocol {
  // Singlton method
  const LoginApi._singlton();
  static const LoginApi _instance = LoginApi._singlton();
  factory LoginApi.instance() => _instance;

  @override
  Future<LoginHandle?> login({
    required String email,
    required String password,
  }) =>
      Future.delayed(
          const Duration(seconds: 2),
          () => 'to@mail.com' == email && 'nopass' == password
              ? const LoginHandle.fooBar()
              : null);
}
