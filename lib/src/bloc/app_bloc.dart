import 'package:bloc/bloc.dart';
import 'package:notes_bloc/src/bloc/app_actions.dart';
import 'package:notes_bloc/src/bloc/app_state.dart';
import 'package:notes_bloc/src/data/models/login_error.dart';
import 'package:notes_bloc/src/data/models/login_handle.dart';
import 'package:notes_bloc/src/data/network/login_api.dart';
import 'package:notes_bloc/src/data/network/note_api.dart';

class AppBloc extends Bloc<AppActions, AppState> {
  final LoginApiProtocol loginApi;
  final NotesApiProtocol noteApi;

  AppBloc({required this.loginApi, required this.noteApi})
      : super(const AppState.empty()) {
    on<LoginAction>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final loginHandle = await loginApi.login(
        email: event.email,
        password: event.password,
      );

      emit(state.copyWith(
          isLoading: false,
          loginError:
              loginHandle == null ? const LoginError.invalidHandle() : null,
          loginHandle: loginHandle));
    });

    on<LoadNotesAction>(((event, emit) async {
      // start loading to process the notes
      emit(state.copyWith(isLoading: true));

      // check the login hangle is validate or not
      if (const LoginHandle.fooBar() != state.loginHandle) {
        emit(state.copyWith(
          isLoading: false,
          loginError: const LoginError.invalidHandle(),
        ));
      } else {
        // fetch the notes
        final notes = await noteApi.getNotes(loginHandle: state.loginHandle!);

        emit(state.copyWith(
          isLoading: false,
          loginError: null,
          notes: notes,
        ));
      }
    }));
  }
}
