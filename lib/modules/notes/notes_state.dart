import 'package:todo_app/models/note_model.dart';

abstract class NotesState {}

class NotesStateEmpty extends NotesState {}

class NotesStateCreatingLoading extends NotesState {}

class NotesStateLoading extends NotesState {}

class NotesStateSucess extends NotesState {
  final List<NoteModel> notes;
  NotesStateSucess({
    required this.notes,
  });
}
