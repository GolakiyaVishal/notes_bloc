import 'package:flutter/foundation.dart' show immutable;

@immutable
class LoginError {
  final String error;

  const LoginError({required this.error});

  const LoginError.invalidHandle()
      : error = 'Please try again with valid credentials';
}
