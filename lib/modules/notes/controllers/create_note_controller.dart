import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/modules/notes/controllers/create_note_state.dart';
import 'package:todo_app/modules/notes/services/notes_services.dart';
import 'package:todo_app/shared/utils/app_notifications.dart';

class CreateNoteController {
  final stateNotifier = ValueNotifier<CreateNoteState>(CreateNoteStateEmpty());

  CreateNoteState get state => stateNotifier.value;
  set state(CreateNoteState state) => stateNotifier.value = state;

  final String loggedUserId;

  CreateNoteController({
    required this.loggedUserId,
  });

  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final subtitleController = TextEditingController();

  Future<void> createNote() async {
    if (formKey.currentState!.validate()) {
      state = CreateNoteStateLoading();

      await Future.delayed(const Duration(seconds: 2));

      final notesService = NotesService();

      try {
        final createdNote = await notesService.createNote(
          title: titleController.text,
          subtitle: subtitleController.text,
          loggedUserId: loggedUserId,
        );

        Modular.to.pop(createdNote);
      } catch (e) {
        AppNotifications.errorNotificationBanner(e);
      }

      state = CreateNoteStateLoading();
    }
  }
}
