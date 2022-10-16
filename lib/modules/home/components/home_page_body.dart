import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app_controller.dart';
import 'package:todo_app/models/note_model.dart';

import 'package:todo_app/models/user_model.dart';
import 'package:todo_app/modules/core/core.dart';
import 'package:todo_app/modules/home/components/empty_notes_message.dart';
import 'package:todo_app/modules/home/components/home_page_header.dart';
import 'package:todo_app/modules/home/components/notes_list.dart';
import 'package:todo_app/modules/home/components/notes_section_header.dart';
import 'package:todo_app/modules/notes/controllers/notes_controller.dart';
import 'package:todo_app/modules/notes/controllers/notes_state.dart';
import 'package:todo_app/modules/notes/pages/create_note_page.dart';
import 'package:todo_app/modules/theme/theme_controller.dart';
import 'package:todo_app/shared/components/app_loading_icon.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({
    Key? key,
    required this.loggedUser,
  }) : super(key: key);

  final UserModel loggedUser;

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  late NotesController notesController;

  @override
  void initState() {
    notesController = NotesController(widget.loggedUser.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appController = AppController.instance(context);
    final themeController = ThemeController.instance(context);
    return Column(
      children: [
        const SizedBox(height: 20),
        HomePageHeader(
          name: appController.loggedUser?.name ?? "",
          onLogout: appController.logout,
          onChangeTheme: () {
            themeController.changeTheme(context);
          },
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.subBackgroundColor(context),
              borderRadius: AppSizes.defaultBorderRadius,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.defaultPaddingSize,
              vertical: 20,
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 30,
            ),
            child: Column(
              children: [
                NotesSectionHeader(
                  onAdd: () async {
                    final response = await Modular.to.pushNamed(
                      CreateNotePage.routeName,
                      arguments: widget.loggedUser.id,
                    );

                    if (response != null && response.runtimeType == NoteModel) {
                      notesController.loadNotes();
                    }
                  },
                ),
                const SizedBox(height: 10),
                ValueListenableBuilder<NotesState>(
                  valueListenable: notesController.stateNotifier,
                  builder: (context, state, _) {
                    if (state.runtimeType == NotesStateLoading) {
                      return const Center(
                        child: AppLoadingIcon(),
                      );
                    }
                    if (state.runtimeType == NotesStateSucess) {
                      final sucessState = state as NotesStateSucess;
                      return NotesList(notes: sucessState.notes);
                    }

                    return const EmptyNotesMessage();
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
