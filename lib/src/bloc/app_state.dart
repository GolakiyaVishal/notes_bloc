import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:notes_bloc/src/data/models/login_error.dart';
import 'package:notes_bloc/src/data/models/login_handle.dart';
import 'package:notes_bloc/src/data/models/note.dart';

/// [Equatable] ia a base class that faciliate [operator ==] and [hashCode]
@immutable
class AppState implements Equatable {
  final bool isLoading;
  final LoginError? loginError;
  final LoginHandle? loginHandle;
  final Iterable<Note>? notes;

  const AppState.empty()
      : isLoading = false,
        loginError = null,
        loginHandle = null,
        notes = null;

  const AppState({
    required this.isLoading,
    required this.loginError,
    required this.loginHandle,
    required this.notes,
  });

  @override
  String toString() => {
        'isLoading': isLoading,
        'loginError': loginError,
        'loginHandle': loginHandle,
        'notes': notes
      }.toString();

  @override
  List<Object?> get props => [isLoading, loginError, loginHandle, notes];

  @override
  bool? get stringify => true;

  AppState copyWith({
    bool? isLoading,
    LoginError? loginError,
    LoginHandle? loginHandle,
    Iterable<Note>? notes,
  }) {
    return AppState(
        isLoading: isLoading ?? this.isLoading,
        loginError: loginError ?? this.loginError,
        loginHandle: loginHandle ?? this.loginHandle,
        notes: notes ?? this.notes);
  }
}
