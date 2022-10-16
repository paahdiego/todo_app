import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:todo_app/modules/core/core.dart';
import 'package:todo_app/modules/notes/controllers/create_note_controller.dart';
import 'package:todo_app/modules/notes/controllers/create_note_state.dart';
import 'package:todo_app/shared/components/app_default_button.dart';
import 'package:todo_app/shared/components/app_input_field.dart';
import 'package:todo_app/shared/components/app_loading_icon.dart';

import 'package:validatorless/validatorless.dart';

class CreateNoteBody extends StatefulWidget {
  const CreateNoteBody({
    Key? key,
    required this.loggedUserId,
  }) : super(key: key);

  final String loggedUserId;

  @override
  State<CreateNoteBody> createState() => _CreateNoteBodyState();
}

class _CreateNoteBodyState extends State<CreateNoteBody> {
  late CreateNoteController createNoteController;

  @override
  void initState() {
    createNoteController = CreateNoteController(
      loggedUserId: widget.loggedUserId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);

    return Container(
      height: sizes.safeHeight,
      padding: EdgeInsets.symmetric(horizontal: sizes.displayWidth * 0.15),
      child: Form(
        key: createNoteController.formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Criar nova nota",
                  style: AppTextStyles.bodyText1(context)?.copyWith(
                    fontSize: 24,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              AppInputField(
                label: "Título",
                controller: createNoteController.titleController,
                textInputAction: TextInputAction.next,
                validator: Validatorless.multiple([
                  Validatorless.required("Digite um título válido"),
                ]),
              ),
              const SizedBox(height: 20),
              AppInputField(
                label: "Subtítulo",
                controller: createNoteController.subtitleController,
                textInputAction: TextInputAction.next,
                validator: Validatorless.multiple([
                  Validatorless.required("Digite um subtítulo válido"),
                ]),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      child: const Text('voltar'),
                      onPressed: () {
                        Modular.to.pop();
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: AppDefaultButton(
                      onPressed: () {
                        createNoteController.createNote();
                      },
                      child: ValueListenableBuilder<CreateNoteState>(
                        valueListenable: createNoteController.stateNotifier,
                        builder: (context, state, _) {
                          if (state.runtimeType == CreateNoteStateLoading) {
                            return const AppLoadingIcon(
                              size: 18,
                              valueColor: AppColors.white,
                            );
                          }

                          return const Text("Salvar");
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
