import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/note_model.dart';
import 'package:todo_app/shared/utils/shared_preferences_keys.dart';

class NotesRepository {
  Future<NoteModel> create({
    required String title,
    required String subtitle,
    required String loggedUserId,
  }) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final notes = await list();

    final createNote = NoteModel(
      title: title,
      subtitle: subtitle,
      createdAt: DateTime.now(),
      createdBy: loggedUserId,
    );

    if (notes == null) {
      await sharedPreferences.setStringList(
        SharedPreferencesKeys.notes,
        [
          createNote.toJson(),
        ],
      );
      return createNote;
    }

    notes.add(createNote);

    final notesToJson = listToJson(notes: notes);

    await sharedPreferences.setStringList(
      SharedPreferencesKeys.notes,
      notesToJson,
    );

    return createNote;
  }

  List<String> listToJson({required List<NoteModel> notes}) {
    return notes.map((e) => e.toJson()).toList();
  }

  Future<List<NoteModel>?> list({
    String? loggedUserId,
  }) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final contains = sharedPreferences.containsKey(SharedPreferencesKeys.notes);

    if (!contains) {
      return null;
    }

    final jsons = sharedPreferences.getStringList(SharedPreferencesKeys.notes);
    final notes = jsons!.map((element) => NoteModel.fromJson(element)).toList();

    if (loggedUserId != null) {
      final filteredNotes =
          notes.where((e) => e.createdBy == loggedUserId).toList();

      return filteredNotes;
    }

    return notes;
  }
}
