import 'package:flutter/material.dart';

import 'package:todo_app/modules/notes/components/create_note_body.dart';
import 'package:todo_app/shared/components/app_gradient_container.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({
    Key? key,
    required this.loggedUserId,
  }) : super(key: key);

  final String loggedUserId;

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppGradientContainer(
      child: SafeArea(
        child: Scaffold(
          body: CreateNoteBody(
            loggedUserId: widget.loggedUserId,
          ),
        ),
      ),
    );
  }
}
