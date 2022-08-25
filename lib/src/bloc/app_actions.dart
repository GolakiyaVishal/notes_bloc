import 'dart:ui';

import 'package:flutter/foundation.dart' show immutable;
import 'package:notes_bloc/src/data/models/login_handle.dart';

@immutable
abstract class AppActions {}

@immutable
class LoginAction extends AppActions {
  final String email;
  final String password;

  LoginAction({required this.email, required this.password});
}

@immutable
class LoadNotesAction extends AppActions {
  final LoginHandle loginHandle;

  LoadNotesAction({required this.loginHandle});
}
