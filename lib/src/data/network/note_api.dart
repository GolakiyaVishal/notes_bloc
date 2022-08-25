import 'package:flutter/foundation.dart' show immutable;
import 'package:notes_bloc/src/data/models/login_handle.dart';
import 'package:notes_bloc/src/data/models/note.dart';

/// [NotesApiProtocol]
/// abstract class for not api
@immutable
abstract class NotesApiProtocol {
  const NotesApiProtocol();

  /// [LoginHandle] to check the user has login or not
  Future<Iterable<Note>?> getNotes({required LoginHandle loginHandle});
}

/// [NotesApi] implementation of [NotesApiProtocol]
@immutable
class NotesApi implements NotesApiProtocol {
  @override
  Future<Iterable<Note>?> getNotes({required LoginHandle loginHandle}) =>
      Future.delayed(const Duration(seconds: 2),
          () => const LoginHandle.fooBar() == loginHandle ? mokeNotes : null);
}
