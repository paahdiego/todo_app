import 'package:flutter/material.dart';
import 'package:todo_app/models/note_model.dart';
import 'package:todo_app/shared/utils/date_formatter.dart';

class NotesList extends StatelessWidget {
  const NotesList({
    Key? key,
    required this.notes,
  }) : super(key: key);

  final List<NoteModel> notes;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final note = notes[index];
          return Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(note.title),
                    Text(note.subtitle),
                  ],
                ),
              ),
              Text(DateFormatter.formattedDate(note.createdAt)),
            ],
          );
        },
        separatorBuilder: (context, _) => const Divider(),
        itemCount: notes.length,
      ),
    );
  }
}
