import 'package:flutter/material.dart';
import 'package:todo_app/modules/notes/notes_state.dart';
import 'package:todo_app/repositories/notes/notes_repository.dart';

class NotesController {
  final stateNotifier = ValueNotifier<NotesState>(NotesStateEmpty());

  NotesState get state => stateNotifier.value;
  set state(NotesState state) => stateNotifier.value = state;

  final notesRepository = NotesRepository();

  final String loggedUserId;

  NotesController(
    this.loggedUserId,
  ) {
    initialize();
  }

  Future<void> initialize() async {
    state = NotesStateLoading();

    await Future.delayed(const Duration(seconds: 2));

    final notes = await notesRepository.list(loggedUserId: loggedUserId);

    if (notes != null && notes.isNotEmpty) {
      state = NotesStateSucess(notes: notes);
      return;
    }

    state = NotesStateEmpty();
  }

  Future<void> createNote() async {}
}
