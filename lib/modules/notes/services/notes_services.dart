import 'package:todo_app/models/note_model.dart';
import 'package:todo_app/repositories/notes/notes_repository.dart';

class NotesService {
  Future<NoteModel> createNote({
    required String title,
    required String subtitle,
    required String loggedUserId,
  }) async {
    final notesRepository = NotesRepository();

    try {
      final note = await notesRepository.create(
        title: title,
        subtitle: subtitle,
        loggedUserId: loggedUserId,
      );
      return note;
    } catch (e) {
      rethrow;
    }
  }
}
