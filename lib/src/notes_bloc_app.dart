import 'package:flutter/material.dart';
import 'package:notes_bloc/src/presentation/screens/home_screen.dart';

class NotesBlocApp extends StatelessWidget {
  const NotesBlocApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
